/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Allocator } from './Ring'
import { NumberContainer, NumberContainerArray } from './Containers'

export type BypassFunctionType<T> = ((input: T) => T);

@Concurrent
export function bypassFunction<T>(input: T): T {
  return input;
}

@Concurrent
export function allocateAndBypassFunction<T>(input: T): T {
  Allocator.allocate();
  return input;
}

@Concurrent
export function fillAndBypass(containers: NumberContainerArray, value: number): number {
  // NOTE this can be used only after concurrent arrays become available
  let containerArray: NumberContainer[] = containers.data;
  let container: NumberContainer = containerArray[value];
  container.data = value;
  return container.data;
}

@Concurrent
export function fillAndBypassContainer(container: NumberContainer, value: number): number {
  container.data = value;
  return container.data;
}

