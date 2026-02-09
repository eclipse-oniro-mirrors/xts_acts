/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium'
import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';

export default function RequestModalUIExtension() {

  describe('ACTS_RequestModalUIExtension', () => {
    let TAG = "";

    /**
     * @tc.name   ACTS_RequestModalUIExtension001
     * @tc.number ACTS_UIExtension_RequestModalUIExtension001
     * @tc.desc   request Modal UIExtension by want
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_RequestModalUIExtension001', Level.LEVEL0, async (done: Function) => {
      TAG = 'ACTS_UIExtension_RequestModalUIExtension001 == ';
      console.log(TAG + "begin");
      try {
        let want: Want = {
          bundleName: 'com.example.myapplication',
          abilityName: 'requestModalUIExtension',
          moduleName: 'requestModalUIExtension',
          parameters: {
            bundleName: 'com.example.myapplication'
          }
        };
        globalThis.abilityContext.requestModalUIExtension(want, (err: BusinessError) => {
          if (err) {
            console.error(TAG + "requestModalUIExtension001 fail, err:" + JSON.stringify(err));
            expect(err.code).assertEqual(202);
            done();
          } else {
            console.log(TAG + "requestModalUIExtension001 success");
          }
        });
      } catch (error) {
        console.log(TAG + "requestModalUIExtension001 catch fail, err:" + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   ACTS_RequestModalUIExtension002
     * @tc.number ACTS_UIExtension_RequestModalUIExtension002
     * @tc.desc   request Modal UIExtension by want
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_RequestModalUIExtension002', Level.LEVEL0, async (done: Function) => {
      TAG = 'ACTS_UIExtension_RequestModalUIExtension002 == ';
      console.log(TAG + "begin");
      try {
        let want: Want = {
          bundleName: 'com.example.myapplication',
          abilityName: 'requestModalUIExtension',
          moduleName: 'requestModalUIExtension',
          parameters: {
            bundleName: 'com.example.myapplication'
          }
        };
        globalThis.abilityContext.requestModalUIExtension(want).then(() => {
          console.log(TAG + "requestModalUIExtension002 success");
        }).catch((err: BusinessError) => {
          console.error(TAG + "requestModalUIExtension002 fail, err:" + JSON.stringify(err));
          expect(err.code).assertEqual(202);
          done();
        })
      } catch (error) {
        console.log(TAG + "requestModalUIExtension002 catch fail, err:" + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
  })
}