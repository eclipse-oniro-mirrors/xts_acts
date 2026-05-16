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

export function testThisValueCallString() {
  'use strict';
  const result = String.prototype.toString.call('test');
  return result;
}

export function testThisValueApplyString() {
  'use strict';
  const result = String.prototype.toString.apply('test');
  return result;
}

export function testThisValueBindString() {
  'use strict';
  const bound = String.prototype.toString.bind('test');
  return bound();
}

export function testThisValueCallStringObject() {
  'use strict';
  const strObj = new String('hello');
  const result = String.prototype.toString.call(strObj);
  return result;
}

export function testThisValueApplyStringObject() {
  'use strict';
  const strObj = new String('hello');
  const result = String.prototype.toString.apply(strObj);
  return result;
}

export function testThisValueUndefinedTypeError() {
  'use strict';
  try {
    String.prototype.toString.call(undefined);
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function testThisValueNullTypeError() {
  'use strict';
  try {
    String.prototype.toString.call(null);
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function testThisValueNumberTypeError() {
  'use strict';
  try {
    String.prototype.toString.call(123);
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function testThisValueBooleanTypeError() {
  'use strict';
  try {
    String.prototype.toString.call(true);
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function testThisValueObjectTypeError() {
  'use strict';
  try {
    String.prototype.toString.call({});
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function testThisValueArrayTypeError() {
  'use strict';
  try {
    String.prototype.toString.call([1, 2, 3]);
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function testThisValueFunctionTypeError() {
  'use strict';
  try {
    String.prototype.toString.call(function() {});
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function testThisValueSymbolTypeError() {
  'use strict';
  try {
    String.prototype.toString.call(Symbol('test'));
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function testThisValueBigintTypeError() {
  'use strict';
  try {
    String.prototype.toString.call(123n);
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}
