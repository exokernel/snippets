# Upgrading Go version

go mod edit -go=1.20
go mod tidy
go get -u ./...
go mod tidy
