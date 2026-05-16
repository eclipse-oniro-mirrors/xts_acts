/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
export const getAbilityResourceInfo: (fileType: string) => [
  number,
  boolean,
  number,
  string | null,
  string | null,
  string | null,
  string | null,
  boolean
];

export const getBundleNameTest: (fileType: string) => number;

export const getModuleNameTest: (fileType: string) => number;

export const getAbilityNameTest: (fileType: string) => number;

export const getLabelTest: (fileType: string) => number;

export const getAppIndexTest: (fileType: string) => number;

export const checkDefaultAppTest: (fileType: string) => number;

export const getDrawableDescriptorTest: (fileType: string) => number;

export const abilityResourceInfoDestroyTest: (fileType: string) => number;

export const getAbilityResourceErrorTest: (fileType: string) => number;