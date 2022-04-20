resource "aws_dynamodb_table" "visitor_count_table" {
  name         = "VisitorCount"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "stat"

  attribute {
    name = "stat"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "view-count" {
  table_name = aws_dynamodb_table.visitor_count_table.name
  hash_key   = aws_dynamodb_table.visitor_count_table.hash_key

  item = <<ITEM
{
  "stat": {"S": "view-count"},
  "quantity": {"N": "1"}
}
ITEM
}

