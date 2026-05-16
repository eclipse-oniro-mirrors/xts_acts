/*
* Copyright (C) 2026 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

// Test basic custom splitter with Symbol.split
export function testBasicCustomSplitter() {
  const customSplitter = {
    [Symbol.split](str) {
      return ["custom", "split", "result"];
    }
  };
  const str = "Hello World";
  const result = str.split(customSplitter);
  return result;
}

// Test custom splitter with limit parameter
export function testCustomSplitterWithLimit() {
  const customSplitter = {
    [Symbol.split](str, limit) {
      const parts = str.split(" ");
      return limit ? parts.slice(0, limit) : parts;
    }
  };
  const str = "a b c d e";
  const result = str.split(customSplitter, 3);
  return result;
}

// Test conditional splitter based on uppercase letters
export function testConditionalSplitter() {
  const conditionalSplitter = {
    [Symbol.split](str) {
      const results = [];
      let current = "";
      for (let i = 0; i < str.length; i++) {
        if (str[i] === str[i].toUpperCase() && current.length > 0 && str[i] !== str[i].toLowerCase()) {
          results.push(current);
          current = str[i];
        } else {
          current += str[i];
        }
      }
      if (current) results.push(current);
      return results;
    }
  };
  const str = "helloWorldTestExample";
  const result = str.split(conditionalSplitter);
  return result;
}

// Test splitter that filters empty strings
export function testFilterSplitter() {
  const filterSplitter = {
    [Symbol.split](str) {
      return str.split(" ").filter(s => s.length > 0);
    }
  };
  const str = "a  b   c";
  const result = str.split(filterSplitter);
  return result;
}
