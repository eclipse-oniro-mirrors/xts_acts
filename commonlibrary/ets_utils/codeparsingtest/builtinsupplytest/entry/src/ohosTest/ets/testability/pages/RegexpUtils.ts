/*
* Copyright (C) 2024 HiHope Open Source Organization.
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

export function regExpProtoCompile(pattern: string, flags?: string):RegExp {
  return RegExp.prototype.compile(pattern, flags);
}

export function regExpProtoExec(str: string): RegExpExecArray | null {
  return RegExp.prototype.exec(str);
}

export function regExpSymbolMatch(pattern: RegExp, str: string): RegExpMatchArray | null {
  return pattern[Symbol.match](str);
}

export function regExpSymbolMatchAll(pattern: RegExp, str: string): IterableIterator<RegExpMatchArray> {
  return pattern[Symbol.matchAll](str);
}

export function regExpSymbolReplace(pattern: RegExp, str: string, replaceStr: string): string {
  return pattern[Symbol.replace](str, replaceStr);
}

export function regExpSymbolSearch(pattern: RegExp, str: string): number {
  return pattern[Symbol.search](str);
}

export function regExpSymbolSplit(pattern: RegExp, str: string): string[] {
  return pattern[Symbol.split](str);
}

export function regExp$str(pattern: RegExp, str: string): any {
  return RegExp[str];
}

export function regExpSymbolSpecies(pattern: RegExp): RegExpConstructor {
  return RegExp[Symbol.species];
}


