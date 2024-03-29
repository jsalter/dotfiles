{
  global: {
    check_for_updates_on_startup: false,
    show_in_menu_bar: false,
    show_profile_name_in_menu_bar: false,
  },
  profiles: [
    {
      complex_modifications: {
        parameters: {
          'basic.simultaneous_threshold_milliseconds': 50,
          'basic.to_delayed_action_delay_milliseconds': 500,
          'basic.to_if_alone_timeout_milliseconds': 1000,
          'basic.to_if_held_down_threshold_milliseconds': 500,
          'mouse_motion_to_scroll.speed': 100,
        },
        rules: [
          {
            description: 'Double tap fn to send a non-US backslash',
            manipulators: [
              {
                type: 'basic',
                from: {
                  key_code: 'fn',
                  modifiers: {
                    optional: [
                      'any',
                    ],
                  },
                },
                to: [
                  {
                    key_code: 'non_us_backslash',
                  },
                ],
                conditions: [
                  {
                    type: 'variable_if',
                    name: 'fn pressed',
                    value: 1,
                  },
                ],
              },
              {
                type: 'basic',
                from: {
                  key_code: 'fn',
                  modifiers: {
                    optional: [
                      'any',
                    ],
                  },
                },
                to: [
                  {
                    set_variable: {
                      name: 'fn pressed',
                      value: 1,
                    },
                  },
                  {
                    key_code: 'fn',
                  },
                ],
                to_delayed_action: {
                  to_if_invoked: [
                    {
                      set_variable: {
                        name: 'fn pressed',
                        value: 0,
                      },
                    },
                  ],
                  to_if_canceled: [
                    {
                      set_variable: {
                        name: 'fn pressed',
                        value: 0,
                      },
                    },
                  ],
                },
              },
            ],
          },
          {
            description: 'Spacebar to Shift+Control+Option',
            manipulators: [
              {
                type: 'basic',
                from: {
                  key_code: 'spacebar',
                  modifiers: {
                    optional: [
                      'any',
                    ],
                  },
                },
                parameters: {
                  'basic.to_if_held_down_threshold_milliseconds': 200,
                },
                to_if_held_down: [
                  {
                    key_code: 'left_shift',
                    modifiers: [
                      'left_control',
                      'left_option',
                    ],
                    lazy: true,
                  },
                ],
                to_if_alone: [
                  {
                    key_code: 'spacebar',
                  },
                ],
              },
            ],
          },
          {
            description: 'Change caps_lock to control if pressed with other keys, to escape if pressed alone.',
            manipulators: [
              {
                from: {
                  key_code: 'caps_lock',
                  modifiers: {
                    optional: [
                      'any',
                    ],
                  },
                },
                to: [
                  {
                    key_code: 'left_control',
                  },
                ],
                to_if_alone: [
                  {
                    key_code: 'escape',
                  },
                ],
                type: 'basic',
              },
            ],
          },
          {
            description: 'Better Shifting: Parentheses on shift keys',
            manipulators: [
              {
                from: {
                  key_code: 'left_shift',
                },
                to: [
                  {
                    key_code: 'left_shift',
                  },
                ],
                to_if_alone: [
                  {
                    key_code: '9',
                    modifiers: [
                      'left_shift',
                    ],
                  },
                ],
                type: 'basic',
              },
              {
                from: {
                  key_code: 'right_shift',
                },
                to: [
                  {
                    key_code: 'right_shift',
                  },
                ],
                to_if_alone: [
                  {
                    key_code: '0',
                    modifiers: [
                      'right_shift',
                    ],
                  },
                ],
                type: 'basic',
              },
            ],
          },
          {
            description: 'Better Shifting: Shift rolls',
            manipulators: [
              {
                from: {
                  key_code: 'left_shift',
                  modifiers: {
                    mandatory: [
                      'right_shift',
                    ],
                  },
                },
                to: [
                  {
                    key_code: 'left_shift',
                  },
                  {
                    key_code: 'right_shift',
                  },
                ],
                to_if_alone: [
                  {
                    key_code: '0',
                    modifiers: [
                      'right_shift',
                      'left_shift',
                    ],
                  },
                  {
                    key_code: '9',
                    modifiers: [
                      'right_shift',
                      'left_shift',
                    ],
                  },
                ],
                type: 'basic',
              },
              {
                from: {
                  key_code: 'right_shift',
                  modifiers: {
                    mandatory: [
                      'left_shift',
                    ],
                  },
                },
                to: [
                  {
                    key_code: 'right_shift',
                  },
                  {
                    key_code: 'left_shift',
                  },
                ],
                to_if_alone: [
                  {
                    key_code: '9',
                    modifiers: [
                      'right_shift',
                    ],
                  },
                  {
                    key_code: '0',
                    modifiers: [
                      'right_shift',
                    ],
                  },
                ],
                type: 'basic',
              },
            ],
          },
          {
            description: 'Better Shifting: End parenthesis on shift + space',
            manipulators: [
              {
                from: {
                  key_code: 'spacebar',
                  modifiers: {
                    mandatory: [
                      'right_shift',
                    ],
                  },
                },
                to: [
                  {
                    key_code: '0',
                    modifiers: [
                      'right_shift',
                    ],
                  },
                  {
                    key_code: 'spacebar',
                  },
                ],
                type: 'basic',
              },
            ],
          },
        ],
      },
      devices: [
        {
          disable_built_in_keyboard_if_exists: false,
          fn_function_keys: [
            { from: { key_code: 'f1' }, to: [{ key_code: 'f1' }] },
            { from: { key_code: 'f2' }, to: [{ key_code: 'f2' }] },
            { from: { key_code: 'f3' }, to: [{ key_code: 'f3' }] },
            { from: { key_code: 'f4' }, to: [{ key_code: 'f4' }] },
            { from: { key_code: 'f5' }, to: [{ key_code: 'f5' }] },
            { from: { key_code: 'f6' }, to: [{ key_code: 'f6' }] },
            { from: { key_code: 'f7' }, to: [{ key_code: 'f7' }] },
            { from: { key_code: 'f8' }, to: [{ key_code: 'f8' }] },
            { from: { key_code: 'f9' }, to: [{ key_code: 'f9' }] },
            { from: { key_code: 'f10' }, to: [{ key_code: 'f10' }] },
            { from: { key_code: 'f11' }, to: [{ key_code: 'f11' }] },
            { from: { key_code: 'f12' }, to: [{ key_code: 'f12' }] },
          ],
          identifiers: {
            is_keyboard: true,
            is_pointing_device: false,
            product_id: 258,
            vendor_id: 10730,
          },
          ignore: false,
          manipulate_caps_lock_led: true,
          simple_modifications: [],
        },
      ],
      fn_function_keys: [],
      name: 'Default profile',
      parameters: {
        delay_milliseconds_before_open_device: 1000,
      },
      selected: true,
      simple_modifications: [],
      virtual_hid_keyboard: {
        country_code: 0,
        indicate_sticky_modifier_keys_state: true,
        mouse_key_xy_scale: 100,
      },
    },
  ],
}
