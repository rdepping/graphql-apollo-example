package graphqlapi.authz

# Allow HR members to get anyone's salary.
allowed_query(q) {
  selected_salary(q)
  input.user == hr[_]
}

# David is the only member of HR.
hr = [
  "david",
]

# Ensure we're dealing with a selection set that includes the "salary" field.
selected_salary(value) := value.SelectionSet[_].Name == "salary"
