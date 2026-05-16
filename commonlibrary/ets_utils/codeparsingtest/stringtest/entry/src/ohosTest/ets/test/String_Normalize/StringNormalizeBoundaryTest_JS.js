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

export function test001() {
  let str = '\u00F1';
  let thrown = false;
  try {
    str.normalize('nfc');
  } catch (e) {
    thrown = true;
  }
  return { thrown };
}

export function test002() {
  let str = 'test';
  let thrown = false;
  try {
    str.normalize('');
  } catch (e) {
    thrown = true;
  }
  return { thrown };
}

export function test003() {
  let str = 'test';
  let invalidForms = ['ABC', 'NFC ', ' NFC', 'NFE', '123'];
  let throwCount = 0;
  for (let i = 0; i < invalidForms.length; i++) {
    try {
      str.normalize(invalidForms[i]);
    } catch (e) {
      throwCount++;
    }
  }
  return { throwCount };
}

export function test004() {
  let str = 'test';
  let thrown = false;
  try {
    str.normalize(0);
  } catch (e) {
    thrown = true;
  }
  return { thrown };
}

export function test005() {
  let str = 'test';
  let thrown = false;
  try {
    str.normalize(null);
  } catch (e) {
    thrown = true;
  }
  return { thrown };
}

export function test006() {
  let str = 'test';
  let thrown = false;
  try {
    str.normalize({});
  } catch (e) {
    thrown = true;
  }
  return { thrown };
}
