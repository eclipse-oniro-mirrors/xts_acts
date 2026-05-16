/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {
  regexpSymbolMatchAll as regexpSymbolMatchAllImpl,
  regexpSymbolSearch as regexpSymbolSearchImpl
} from './RegExpTest';

/** RegExp.prototype[Symbol.matchAll](str) */
export function regexpSymbolMatchAll(regex: RegExp, str: string): IterableIterator<RegExpMatchArray> {
  return regexpSymbolMatchAllImpl(regex, str) as IterableIterator<RegExpMatchArray>;
}

/** RegExp.prototype[Symbol.search](str) */
export function regexpSymbolSearch(re: RegExp, str: string): number {
  return regexpSymbolSearchImpl(re, str) as number;
}
