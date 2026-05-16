/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct Index {
  @State message: string = 'Test Assist';
  @State isKeyStoraged: string = 'FALSE'
  keyAlias = 'assist_key'
  huksOptions: huks.HuksOptions = initProperties()

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('GenerateKey')
          .id('generateKey')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(async (event) => {
            try {
              await huks.generateKeyItem(this.keyAlias, this.huksOptions)
              if(await huks.isKeyItemExist(this.keyAlias, this.huksOptions)) {
                this.isKeyStoraged = 'TRUE'
              }
            } catch (error) {
              let err = error as BusinessError;
              console.error(`Failed to generate key item. error: ${JSON.stringify(err)}`)
            }
          })
        Text(this.isKeyStoraged)
          .id('isKeyStoraged')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}


function initProperties() {
  let properties: huks.HuksParam[] = []
  properties[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  }
  properties[1] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE,
  }
  properties[2] = {
    tag: huks.HuksTag.HUKS_TAG_DIGEST,
    value: huks.HuksKeyDigest.HUKS_DIGEST_SHA256,
  }
  properties[3] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128,
  }
  properties[4] = {
    tag: huks.HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG,
    value: huks.HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS,
  }
  let huksOptions: huks.HuksOptions = {
    properties: properties
  }
  return huksOptions
}