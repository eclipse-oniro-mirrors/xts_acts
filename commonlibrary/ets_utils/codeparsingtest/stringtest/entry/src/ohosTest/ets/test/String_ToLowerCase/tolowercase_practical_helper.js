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

// Filter and map array - handle null/undefined values
export function filterAndMapArray() {
  const arr = ["HELLO", "", "WORLD", null, "TEST"];
  const result = arr
    .filter(s => typeof s === 'string' && s.length > 0)
    .map(s => s.toLowerCase());
  return result;
}

// Normalize user input function
export function normalizeInput(input) {
  return input.trim().toLowerCase();
}

// Case-insensitive array search
export function searchInArray(arr, searchTerm) {
  const lowerSearch = searchTerm.toLowerCase();
  return arr.filter(item => item.toLowerCase().includes(lowerSearch));
}

// Check if any element matches case-insensitively
export function anyMatch(arr, target) {
  const lowerTarget = target.toLowerCase();
  return arr.some(item => item.toLowerCase() === lowerTarget);
}
