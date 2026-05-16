/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @fileoverview Combined Array.from() JS-specific tests
 * This file combines all JS-specific tests for Array.from()
 */

// Import test modules
const symbolTests = require('./from_symbol_test');
const generatorTests = require('./from_generator_test');
const proxyTests = require('./from_proxy_test');
const additionalTests = require('./from_additional_test');

/**
 * Run all Symbol-related tests
 * @returns {Array} Test results
 */
export function runSymbolTests() {
    console.log('=== Running Symbol-related tests ===');
    return [
        symbolTests.testSymbolAsElement(),
        symbolTests.testSymbolIterator(),
        symbolTests.testSymbolSpecies()
    ];
}

/**
 * Run all generator-related tests
 * @returns {Array} Test results
 */
export function runGeneratorTests() {
    console.log('=== Running generator-related tests ===');
    return [
        generatorTests.testGeneratorFunction(),
        generatorTests.testInfiniteGenerator()
    ];
}

/**
 * Run all Proxy-related tests
 * @returns {Array} Test results
 */
export function runProxyTests() {
    console.log('=== Running Proxy-related tests ===');
    return [
        proxyTests.testProxyArray(),
        proxyTests.testProxyArrayLike()
    ];
}

export function runAdditionalTests() {
    console.log('=== Running additional tests ===');
    return [
        additionalTests.testMapKeyValueConversion(),
        additionalTests.testMapKeysConversion(),
        additionalTests.testEmptyMapConversion(),
        additionalTests.testInt8ArrayConversion(),
        additionalTests.testFloat32ArrayConversion(),
        additionalTests.testBigIntTypedArrayConversion(),
        additionalTests.testMappingDifference()
    ];
}

/**
 * Run all tests
 * @returns {Object} Test summary
 */
export function runAllTests() {
    console.log('Running all Array.from() JS-specific tests\n');

    const allResults = [
        ...runSymbolTests(),
        ...runGeneratorTests(),
        ...runProxyTests(),
        ...runAdditionalTests()
    ];

    const passed = allResults.filter(result => result.result === result.expected).length;
    const total = allResults.length;

    console.log(`\n=== Test Summary ===`);
    console.log(`Passed: ${passed}/${total}`);

    if (passed < total) {
        console.log('Failed tests:');
        allResults.forEach((result, index) => {
            if (result.result !== result.expected) {
                console.log(`Test ${index + 1}: Expected ${result.expected}, got ${result.result}`);
            }
        });
    }

    return {
        passed,
        total,
        results: allResults
    };
}

// Run tests if this file is executed directly
if (require.main === module) {
    runAllTests();
}

// Export functions
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        runSymbolTests,
        runGeneratorTests,
        runProxyTests,
        runAdditionalTests,
        runAllTests
    };
}
