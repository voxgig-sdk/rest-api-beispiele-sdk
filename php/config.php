<?php
declare(strict_types=1);

// RestApiBeispiele SDK configuration

class RestApiBeispieleConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "RestApiBeispiele",
                "slug" => "rest-api-beispiele",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
          'transport' => 'base',
        ],
            ],
            "options" => [
                "base" => "https://api.predic8.de",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "delete" => [],
                    "product" => [],
                ],
            ],
            "entity" => [
        'delete' => [
          'fields' => [],
          'name' => 'delete',
          'op' => [
            'remove' => [
              'input' => 'data',
              'name' => 'remove',
              'points' => [
                [
                  'args' => [
                    'params' => [
                      [
                        'example' => 22,
                        'kind' => 'param',
                        'name' => 'product_id',
                        'orig' => 'product_id',
                        'reqd' => true,
                        'type' => '`$INTEGER`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'DELETE',
                  'orig' => '/shop/v2/products/{productId}',
                  'parts' => [
                    'shop',
                    'v2',
                    'products',
                    '{product_id}',
                  ],
                  'rename' => [
                    'param' => [
                      'productId' => 'product_id',
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'product_id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [
              [
                'product',
              ],
            ],
          ],
        ],
        'product' => [
          'fields' => [
            [
              'name' => 'id',
              'short' => 'Eindeutige ID des Produkts',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'name',
              'op' => [
                'create' => [
                  'req' => true,
                  'type' => '`$STRING`',
                ],
                'update' => [
                  'req' => true,
                  'type' => '`$STRING`',
                ],
              ],
              'short' => 'Name des Produkts',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'price',
              'op' => [
                'create' => [
                  'req' => true,
                  'type' => '`$NUMBER`',
                ],
                'update' => [
                  'req' => true,
                  'type' => '`$NUMBER`',
                ],
              ],
              'short' => 'Preis des Produkts',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'self_link',
              'short' => 'Selbstreferenz-Link zur Ressource',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'product',
          'op' => [
            'create' => [
              'input' => 'data',
              'name' => 'create',
              'points' => [
                [
                  'args' => [],
                  'kind' => 'http',
                  'method' => 'POST',
                  'orig' => '/shop/v2/products/',
                  'parts' => [
                    'shop',
                    'v2',
                    'products',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'args' => [
                    'params' => [
                      [
                        'example' => 22,
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'product_id',
                        'reqd' => true,
                        'type' => '`$INTEGER`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/shop/v2/products/{productId}',
                  'parts' => [
                    'shop',
                    'v2',
                    'products',
                    '{id}',
                  ],
                  'rename' => [
                    'param' => [
                      'productId' => 'id',
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
            'patch' => [
              'input' => 'data',
              'name' => 'patch',
              'points' => [
                [
                  'args' => [
                    'params' => [
                      [
                        'example' => 22,
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'product_id',
                        'reqd' => true,
                        'type' => '`$INTEGER`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'PATCH',
                  'orig' => '/shop/v2/products/{productId}',
                  'parts' => [
                    'shop',
                    'v2',
                    'products',
                    '{id}',
                  ],
                  'rename' => [
                    'param' => [
                      'productId' => 'id',
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
            'update' => [
              'input' => 'data',
              'name' => 'update',
              'points' => [
                [
                  'args' => [
                    'params' => [
                      [
                        'example' => 22,
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'product_id',
                        'reqd' => true,
                        'type' => '`$INTEGER`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'PUT',
                  'orig' => '/shop/v2/products/{productId}',
                  'parts' => [
                    'shop',
                    'v2',
                    'products',
                    '{id}',
                  ],
                  'rename' => [
                    'param' => [
                      'productId' => 'id',
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return RestApiBeispieleFeatures::make_feature($name);
    }
}
