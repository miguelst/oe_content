<?php

declare(strict_types = 1);

namespace Drupal\Tests\oe_content\Behat\Context\Annotation;

use Behat\Behat\Context\Annotation\AnnotationReader;
use Drupal\Tests\oe_content\Behat\Hook\Call\CorporateFieldsAlterCall;

/**
 * Entity aware annotation readers.
 *
 * Read annotation that are Drupal content entity-aware, this means annotations
 * that provides an entity type and its bundle, as match 2 and 3 of their
 * matching regular expression.
 */
class EntityAwareAnnotationReader implements AnnotationReader {

  /**
   * List of matching regular expressions and related hook caller class.
   *
   * @var array
   */
  protected $matchers = [
    // Matches @CorporateFieldsAlter(node,article).
    '/^\@(CorporateFieldsAlter\((\w+), ?(\w+)\))(?:\s+(.+))?$/i' => CorporateFieldsAlterCall::class,
  ];

  /**
   * {@inheritdoc}
   */
  public function readCallee($contextClass, \ReflectionMethod $method, $docLine, $description) {

    foreach ($this->matchers as $regex => $class) {
      if (!preg_match($regex, $docLine, $match)) {
        continue;
      }
      $entity_type = $match[2];
      $bundle = $match[3];
      $callable = [$contextClass, $method->getName()];
      return new $class($entity_type, $bundle, $callable, $description);
    }
  }

}