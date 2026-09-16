///|
test "json integer helper keeps decimal-free repr" {
  assert_eq(json_int(2).stringify(), "2")
}
