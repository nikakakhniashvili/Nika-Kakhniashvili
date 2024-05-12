//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Nika Kakhniashvili on 12.05.24.
//

import XCTest
@testable import UnitTestingAssignment

final class UnitTestingAssignmentTests: XCTestCase {
    
    var viewModel: CartViewModel!
    
    override func setUpWithError() throws {
        super.setUp()
        viewModel = CartViewModel()
        viewModel.allproducts = ProductsResponse.dummyProducts
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        super.tearDown()
    }
    
    func testAddProduct() {
        viewModel.addProduct(withID: 1)
        
        XCTAssertEqual(viewModel.selectedProducts.count, 1)
        XCTAssertEqual(viewModel.selectedProducts.first?.id, 1)
    }
    
    func testRemoveProduct() {
        viewModel.addProduct(withID: 1)
        viewModel.removeProduct(withID: 1)
        
        XCTAssertTrue(viewModel.selectedProducts.isEmpty)
    }
    
    func testTotalPrice() {
        let product1 = ProductsResponse.dummyProducts.first(where: { $0.id == 1 })
        let product2 = ProductsResponse.dummyProducts.first(where: { $0.id == 2 })
        
        product1?.selectedQuantity = 1
        product2?.selectedQuantity = 2
        
        viewModel.addProduct(product: product1)
        viewModel.addProduct(product: product2)
        
        let expectedTotalPrice = 549.0 + 899.0 * 2
        XCTAssertEqual(viewModel.totalPrice, expectedTotalPrice)
    }
    
    func testSelectedItemsQuantity() {
        let product1 = ProductsResponse.dummyProducts.first(where: { $0.id == 8 })
        let product2 = ProductsResponse.dummyProducts.first(where: { $0.id == 9 })
        let product3 = ProductsResponse.dummyProducts.first(where: { $0.id == 10 })
        
        product1?.selectedQuantity = 0
        product2?.selectedQuantity = 1
        product3?.selectedQuantity = 2
        
        viewModel.addProduct(withID: 8)
        viewModel.addProduct(withID: 9)
        viewModel.addProduct(withID: 10)
        
        let expectedQuantity = 3
        XCTAssertEqual(viewModel.selectedItemsQuantity, expectedQuantity)
    }
    
    func testAddRandomProduct() {
        viewModel.selectedProducts = ProductsResponse.dummyProducts
        let initialCount = viewModel.selectedProducts.count
        
        viewModel.addRandomProduct()
        
        let addedProduct = viewModel.selectedProducts.last
        XCTAssertEqual(viewModel.selectedProducts.count, initialCount + 1, "The count of selectedProducts did not increase by 1.")
    }
    
    func testRemoveProductByID() {
        let product1 = ProductsResponse.dummyProducts.first(where: { $0.id == 1 })
        let productIDToRemove = 1
        
        viewModel.removeProduct(withID: productIDToRemove)
        
        XCTAssertFalse(viewModel.selectedProducts.contains(where: { $0.id == productIDToRemove }), "Product with ID \(productIDToRemove) was not removed.")
    }
    
    func testProductCountAfterRemovals() {
        viewModel.selectedProducts = ProductsResponse.dummyProducts
        let initialCount = viewModel.selectedProducts.count
        let productIDsToRemove = [1, 2, 3]
        
        productIDsToRemove.forEach { id in
            viewModel.removeProduct(withID: id)
        }
        
        XCTAssertEqual(viewModel.selectedProducts.count, initialCount - productIDsToRemove.count, "The count of selected products did not decrease as expected.")
        print("\(initialCount - productIDsToRemove.count)🟢")
    }
    
    func testClearCart() {
        viewModel.selectedProducts = ProductsResponse.dummyProducts
        
        viewModel.clearCart()
        
        XCTAssertTrue(viewModel.selectedProducts.isEmpty, "The cart is not empty after calling clearCart.")
    }
}
