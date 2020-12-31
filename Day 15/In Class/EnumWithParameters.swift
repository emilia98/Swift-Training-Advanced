enum RequestType {
    case flagging(api : Int)
}

var apiRequest = RequestType.flagging(api: 3)

switch apiRequest {
    case .flagging(let api) :
        print("flagging", api)
}