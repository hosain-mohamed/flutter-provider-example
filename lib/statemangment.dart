
/*State management with Provider 

1) ChangeNotifier 
2) ChangeNofitierProvider
3) Consumer
4) Provider.of
   
   // var cartModel = Provider.of<CartModel>(context);   as consumer
   // var cartModel = Provider.of<CartModel>(context,listen: false);  it wont rebuild the widget

  
//tips : 
  - put consumer deep in the widget tree to abvoid rebuild large part of UI
  - tips :  Just learn how to use changeNotifier , ChangeNotifierProvider and Consumer. Every now and then you might use a Provider
     	    widget if you don’t need to update the UI. Most of the time you won’t need a MultiProvider either if you have a view model for each screen or page 
	    And for injecting dependencies in your view models, GetIt will handle that. No need to worry about ProxyProvider

*/
