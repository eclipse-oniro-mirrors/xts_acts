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

/*
 * Well-known symbol entry points are centralized here so tests can exercise the RegExp-side @@method hooks directly.
 * Keeping this in one module avoids duplicating symbol access boilerplate across MatchTest, SearchTest, and
 * RegExpCompleteTest while preserving identical call shapes.
 */

/** RegExp.prototype[Symbol.matchAll](str) */
export function regexpSymbolMatchAll(regex: RegExp, str: string): IterableIterator<RegExpMatchArray> {
  return str.matchAll(regex);
}

/** RegExp.prototype[Symbol.search](str) */
export function regexpSymbolSearch(re: RegExp, str: string): number {
  return str.search(re);
}
