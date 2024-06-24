# frozen_string_literal: true

{ ru:
  { i18n:
    { plural:
      { keys: %i[zero one few many],
        rule: lambda { |n|
          if n.zero?
            :zero
          elsif ((n % 10) == 1) && ((n % 100 != 11))
            :one
          elsif  [2, 3, 4].include?(n % 10) && [12, 13, 14].exclude?(n % 100)
            :few
          elsif  (n % 10).zero? ||
                 [5, 6, 7, 8, 9].exclude?(n % 10) ||
                 [11, 12, 13, 14].exclude?(n % 100)
            :many
          end
        } } } } }
