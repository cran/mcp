#################
# TEST VARIANCE #
#################
bad_variance = list(
  list(y ~ 1 + sigma(rel(1))),  # no sigma to be relative to
  list(y ~ 1,
       y ~ 1 + sigma(rel(x))),  # no sigma slope to be relative to
  list(y ~ 1 + sigma(q))  # variable does not exist
)

test_bad(bad_variance)


good_variance_essential = list(
  list(y ~ 1 + sigma(x + I(x^2))),
  list(y ~ 1,
       1 + (1|id) ~ rel(1) + I(x^2) + sigma(rel(1) + x)),  # Test with varying change point and more mcp stuff
  list(y | weights(weights_ok) ~ 1 + sigma(1 + x),  # With weights
       ~ 0 + sigma(1 + rel(x)))
)

good_variance_extensive = list(
  list(y ~ 1 + sigma(1)),
  list(y ~ 1 + sigma(1 + sin(x))),
  list(y ~ 1,
       ~ 0 + sigma(rel(1)),  # test relative intercept
       ~ x + sigma(x),
       ~ 0 + sigma(rel(x)))  # test relative slope
)

test_good(good_variance_essential, good_variance_extensive)


#############
# TEST ARMA #
#############
# We can assume that it will fail for the same mis-specifications on the formula
# ar(order, [formula]), since the formula runs through the exact same code as
# sigma and ct.
bad_arma = list(
  list(y ~ ar(0)),  # currently not implemented
  list(y ~ ar(-1)),  # must be positive
  list(y ~ ar(1.5)),  # Cannot be decimal
  list(y ~ ar(1) + ar(2)),  # Only one per segment
  list(y ~ ar("1")),  # Should not take strings
  list(y ~ ar(1 + x)),  # must have order
  list(y ~ ar(x))  # must have order
)

test_bad(bad_arma)


good_arma_essential = list(
  list(y ~ ar(1),
       ~ ar(2, 0 + x)),  # change in ar
  list(y ~ 1,
       ~ 0 + ar(2)),  # onset of AR
  list(y ~ ar(1) + sigma(1 + x),
       ~ ar(2, 1 + I(x^2)) + sigma(1))  # With sigma
)

good_arma_extensive = list(
  list(y ~ ar(1)),  # simple
  list(y ~ ar(5)),  # higher order
  list(y ~ ar(1, 1 + x + I(x^2) + exp(x))),  # complicated regression
  list(y ~ ar(1),
       ~ ar(2, rel(1))),  # Relative to no variance. Perhaps alter this behavior so it becomes illegal?
  list(y ~ 1,
       1 + (1|id) ~ rel(1) + I(x^2) + ar(2, rel(1) + x)),  # varying change point
  list(y | weights(weights_ok) ~ 1 + ar(1),  # With weights
       ~ 0 + ar(2, 1 + x))
)

test_good(good_arma_essential, good_arma_extensive)
