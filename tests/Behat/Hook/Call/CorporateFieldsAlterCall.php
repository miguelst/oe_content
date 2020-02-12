<?php

declare(strict_types = 1);

namespace Drupal\Tests\oe_content\Behat\Hook\Call;

use Drupal\Tests\oe_content\Behat\Hook\Scope\CorporateFieldsAlterScope;

/**
 * Runtime hook that allows to alter entity fields.
 */
class CorporateFieldsAlterCall extends EntityAwareHookBase {

  /**
   * CorporateFieldsAlterCall constructor.
   *
   * @param string $entity_type
   *   Entity type.
   * @param string $bundle
   *   Entity bundle.
   * @param array $callable
   *   Callable, i.e. the actual tagged context method.
   * @param string $description
   *   Call description.
   */
  public function __construct(string $entity_type, string $bundle, array $callable, string $description = '') {
    parent::__construct(CorporateFieldsAlterScope::NAME, $this->getFilterSting($entity_type, $bundle), $callable, $description);
  }

  /**
   * {@inheritdoc}
   */
  public function getName() {
    return 'CorporateFieldsAlter';
  }

}