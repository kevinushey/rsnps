# tests for phenotypes_byid fxn in ropensnp
context("phenotypes_byid")

test_that("phenotypes_byid returns the correct class", {
	expect_that(phenotypes_byid(phenotypeid=12, return_ = 'desc'), is_a("list"))
	expect_that(phenotypes_byid(phenotypeid=12, return_ = 'knownvars'), is_a("list"))
	expect_that(phenotypes_byid(phenotypeid=12, return_ = 'users'), is_a("data.frame"))
})

test_that("phenotypes_byid returns the correct dims for data.frame", {
	expect_that(nrow(phenotypes_byid(phenotypeid=12, return_ = 'users')), equals(56))
})

test_that("phenotypes_byid returns the correct value", {
	expect_that(phenotypes_byid(phenotypeid=12, return_ = 'desc')$description, 
							equals("coloration of facial hair"))
	expect_that(phenotypes_byid(phenotypeid=12, return_ = 'knownvars')$known_variations[1:2], 
							equals(c("Red","Blonde")))
})