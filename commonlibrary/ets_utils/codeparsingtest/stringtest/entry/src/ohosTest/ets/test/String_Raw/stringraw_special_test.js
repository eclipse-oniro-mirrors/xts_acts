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

// Test special scenarios like identity tag construction

export function testIdentityTag() {
  const html = (strings, ...values) => String.raw({ raw: strings }, ...values);
  return html`<canvas>\n</canvas>`;
}

export function testIdentityTagLength() {
  const html = (strings, ...values) => String.raw({ raw: strings }, ...values);
  const doc = html`<canvas>\n</canvas>`;
  return doc.length;
}

export function testIdentityTagHasNewline() {
  const html = (strings, ...values) => String.raw({ raw: strings }, ...values);
  const doc = html`<canvas>\n</canvas>`;
  return doc.indexOf('\n') !== -1;
}

export function testStringRawAsTag() {
  const html = String.raw;
  return html`<canvas>\n</canvas>`;
}

export function testStringRawAsTagLength() {
  const html = String.raw;
  const doc = html`<canvas>\n</canvas>`;
  return doc.length;
}

export function testStringRawAsTagHasNewline() {
  const html = String.raw;
  const doc = html`<canvas>\n</canvas>`;
  return doc.indexOf('\n') !== -1;
}

export function testRegexPattern() {
  return String.raw`\d{3}-\d{3}-\d{4}`;
}

export function testRegexPatternLength() {
  const pattern = String.raw`\d{3}-\d{3}-\d{4}`;
  return pattern.length;
}
