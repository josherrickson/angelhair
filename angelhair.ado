program define angelhair
	syntax varlist(min=2 max=2), by(varname) ///
    [ hnum(integer 20)  ///
    hcolor(string) ///
		bgcolor(string) * ]

  if "`hcolor'" == "" {
    local hcolor "red"
  }
  if "`bgcolor'" == "" {
    local hcolor "gs13"
  }

  qui levelsof `by'
  local num = r(r)

  qui tab `by', matrow(ids)
  preserve
  svmat ids
  gen ran = runiform() if !missing(ids)
  sort ran in 1/`num'

  forvalues i = 1/`num' {
    local id = ids[`i']
    local color = "`bgcolor'"
    if `i' > `num' - `hnum' {
      local color = "`hcolor'"
    }
    local formula `formula' || line `varlist' if `by' == `id', lcolor("`color'")
  }


  twoway scatter `varlist', mcolor("white") `formula' , legend(off) `options'

  restore

end
