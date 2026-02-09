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
import huks from '@ohos.security.huks';

export function isKeyItemExist(srcKeyAlias, huksOptions) {
  return new Promise((resolve, reject) => {
    huks.isKeyItemExist(srcKeyAlias, huksOptions, function (error, data) {
      if (error) {
        reject(error);
      } else {
        resolve(data);
      }
    });
  });
}

export function hasKeyItem(srcKeyAlias, huksOptions) {
  return new Promise((resolve, reject) => {
    huks.hasKeyItem(srcKeyAlias, huksOptions, function (error, data) {
      if (error) {
        reject(error);
      } else {
        resolve(data);
      }
    });
  });
}

export async function generateKeyItem(srcKeyAlias, huksOptions) {
  return new Promise((resolve, reject) => {
    huks.generateKeyItem(srcKeyAlias, huksOptions, function (error, data) {
      if (error) {
        reject(error);
      } else {
        resolve(data);
      }
    });
  });
}

export async function deleteKeyItem(srcKeyAlias, huksOptions) {
  return new Promise((resolve, reject) => {
    huks.deleteKeyItem(srcKeyAlias, huksOptions, function (error, data) {
      if (error) {
        reject(error);
      } else {
        resolve(data);
      }
    });
  });
}