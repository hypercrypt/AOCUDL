#Alternative Objective-C User Defined Literals
AOCUDL was inspired by [Dustin Bachrach](http://www.dbachrach.com/posts/)'s [OCUDL](https://github.com/dbachrach/OCUDL).

The purpose of AOCUDL is to provide a simple way to define custom literals for Objective-C. These are correctly typecast, extensible and flexible.

To add this to your project using [CocoaPods](http://cocoapods.org/) just add the following to your podfile:

    pod 'AOCUDL', '~> 1.0'
    
##Example

    NSURLRequest *request = $(NSURLRequest)[@"http://hypercrypt.net"];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

or simply

    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:$(NSURLRequest)[@"http://hypercrypt.net"] delegate:self];

This functionality is provided by using [Objective-C subscripting](http://clang.llvm.org/docs/ObjectiveCLiterals.html#object-subscripting) and a small macro to glue the whole thing together:

    #define $(cls) (cls *)((id)[cls class])

For a custom class to support AOCUDL all that needs to be implemented is one (or both) of the following methods:

    + (instancetype)objectAtIndexedSubscript:(NSUInteger)index;
    + (instancetype)objectForKeyedSubscript:(id)key;
    
The default implementation on `NSObject` is to return `nil`.

##Useful Literals
AOCUDL includes a few literals for built-in classes, they broadly match those included by [OCUDL](https://github.com/dbachrach/OCUDL#useful-literals). Examples:

- `NSMutableURLRequest`: `$(NSMutableURLRequest)[@"http://hypercrypt.net"]` - This creates a GET request
- `NSNull`: `$NSNull` or `$(NSNull)[any-id-or-NSUInteger]`
- `NSSet`: `$(NSSet)[@[object1, object2, object3]]`
- `NSURLRequest`: `$(NSURLRequest)[@"http://hypercrypt.net"]` - This creates a GET request
- `NSURL`: `$(NSURL)[@"http://hypercrypt.net"]`
- `NSUUID`: `$(NSUUID)[@"8DFD5DF3-6D8B-4DC4-B0A2-1F8ED614FC16"]`
- `UIColor`: `$(UIColor)[0xff0000]`
- `UIImage`: `$(UIImage)[@"testImage"]`
- `UINib`: `$(UINib)[@"AOCUDLViewController"]`
- `UIStoryboard`: `$(UIStoryboard)[@"Main_iPhone"]`
