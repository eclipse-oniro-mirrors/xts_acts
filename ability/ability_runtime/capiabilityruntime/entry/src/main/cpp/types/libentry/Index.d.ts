/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

export const getBundleName: () => string;

export const getCacheDir: () => string;

export const getAreaMode: () => number;

export const getTempDir: () => string;

export const getFilesDir: () => string;

export const getPreferencesDir: () => string;

export const getBundleCodeDir: () => string;

export const getDistributedFilesDir: () => string;

export const getCloudFileDir: () => string;

export const getDatabaseDir: () => string;

export const testGetBundleName: (bundleName: string) => number;

export const testGetCacheDir: (cacheDir: string) => number;

export const testGetAreaMode: (areaMode: number) => number;

export const testGetTempDir: (tempDir: string) => number[];

export const testGetFilesDir: (filesDir: string) => number[];

export const testGetPreferencesDir: (preferencesDir: string) => number[];

export const testGetBundleCodeDir: (bundleCodeDir: string) => number[];

export const testGetDistributedFilesDir: (distributedFilesDir: string) => number[];

export const testGetCloudFileDir: (cloudFileDir: string) => number[];

export const testGetDatabaseDir: (databaseDir: string) => number[];
