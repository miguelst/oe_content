# OpenEuropa Content Reference Code Field

This module provides the storage configuration for a reference code field. A reference code field is a simple text field
that can be used to store codes, IDs and other reference-like information. This field is used on several corporate
content types, so it is packaged in its own, independent, module.

The module also provides a multi-values version of the field described above.

## Usage

By enabling this module you just get the possibility to add a 150 length, non translatable text field named
`oe_reference_code`.

Use the `oe_reference_codes` field if you need to store more than one reference code at the time.
