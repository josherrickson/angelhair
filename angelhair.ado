cap program drop angelhair
program define angelhair
  syntax varlist(min=2 max=2), by(varname) ///
    [ hnum(integer 20)  ///
    hcolor(string) ///
    bgcolor(string) ///
	MAXlines(integer 0) ///
		seed(integer -1) * ]

  if "`hcolor'" == "" {
    local hcolor "red"
  }
  if "`bgcolor'" == "" {
    local bgcolor "gs13"
  }

  if `maxlines' > 0 {
  	local num = `maxlines'
  }
  else {
	  qui levelsof `by'
	  local num = r(r)
  }
  if `num' <= `hnum' {
  	display as error "maxlines must be greated than hnum"
	error 197
  }

  qui tab `by', matrow(ids)
  preserve
  svmat ids

	if `seed' >= 0 {
		set seed `seed'
	}
	
  quietly gen ran = runiform() if !missing(ids)
  sort ran in 1/`num'

  forvalues i = 1/`num' {
    local id = ids[`i']
    if `hnum' >= 0 {
        local color = "`bgcolor'"
        if `i' > `num' - `hnum' {
          local color = "`hcolor'"
        }
    }
    local formula `formula' || line `varlist' if `by' == `id', lcolor("`color'")
  }


  twoway scatter `varlist', mcolor("white") `formula' , legend(off) `options'

  restore

end
