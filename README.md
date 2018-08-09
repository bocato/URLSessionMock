# URLSessionMock
Two implementations to enable URLSession mocking one that uses swizzling and other without it.
- More to come...

# TODO
- Unit tests (in progress)
- RxImplementations
- CI configuration
- Any suggestions?

# DISCLAIMER
I've used lots of sources found on Github and along the web for inspiration, if anything is based on code from you or your company, please send me and email at dubocato@gmail.com so i can put the thanks here.


# *SimpleMock* USAGE
let mockedResponse = HTTPURLResponse(url: mockURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
let mockedSession = MockedURLSession(data: nil, response: mockedResponse, error: nil)
let mockedNetworkDispatcher = NetworkDispatcher(url: mockURL, session: mockedSession)
let mockedPokemonServices = PokemonService(dispatcher: mockedNetworkDispatcher)

# *MockWithSwizzling* USAGE

- Ex1:

let data = "{}".data(using: String.Encoding.utf8)!
try! URLSession.mockEvery(expression: "v2/pokemon/", body: data) 

- Ex2:

try! URLSession.mockEvery(expression: "v2/pokemon") { (url, headers) -> MockResponse in
   let error = NSError(domain: "test", code: 404, userInfo: nil)
   return .failure(error: error)
}


- Ex3:

let jsonDictionary: [String: Any] = [:]       
let data = try! JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=150")!
let request = URLRequest(url: url)
URLSession.mockNext(request: request, body: data, delay: 1)



- Then, remove the mocks with: 

URLSession.removeAllMocks()
*or*
URLSession.removeAllMocks(of: <your request>)
