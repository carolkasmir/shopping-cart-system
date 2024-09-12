void main() {
  // Example item prices
  List<double> itemPrices = [6.0, 22.0, 13.0, 30.0, 8.0];
  
  // Apply discount function to item prices
  double discountPercentage = 10.0; 
  List<double> discountedPrices = applyDiscount(itemPrices, (price) {
    return price * (1 - discountPercentage / 100);
  });

  // Calculate the total price after discount
  double totalPrice = calculateTotal(discountedPrices, taxRate: 0.08); 

  // Calculate factorial discount and apply it
  int numberOfItems = discountedPrices.length;
  double factorialDiscount = calculateFactorialDiscount(numberOfItems);
  double finalPrice = totalPrice * (1 - factorialDiscount / 100);

  print('Original Prices: $itemPrices');
  print('Discounted Prices: $discountedPrices');
  print('Total Price After Discount and Tax: \$${totalPrice.toStringAsFixed(2)}');
  print('Final Price After Factorial Discount: \$${finalPrice.toStringAsFixed(2)}');
}

// Function to calculate the total price with optional tax
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double subtotal = prices.fold(0.0, (sum, price) => sum + price);
  return subtotal * (1 + taxRate);
}

// Function to apply a discount function to a list of prices
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map((price) => discountFunction(price)).toList();
}

// Recursive function to calculate factorial discount
double calculateFactorialDiscount(int n) {
  if (n <= 1) {
    return 0.0;
  } else {
    return factorial(n) / 100.0;
  }
}

// Helper function to calculate factorial
double factorial(int n) {
  if (n == 1 || n == 0) return 1;
  return n * factorial(n - 1);
}
