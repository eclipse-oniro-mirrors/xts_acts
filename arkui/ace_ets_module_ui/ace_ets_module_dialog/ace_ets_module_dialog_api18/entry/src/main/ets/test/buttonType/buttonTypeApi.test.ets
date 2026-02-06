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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';

let emitKey = 'emitUserAgent';

export default function buttonTypeTest() {
  describe('ActsbuttonTypeTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/buttonType/buttonTypeApi',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get buttonType state success ' + JSON.stringify(pages));
        if (!('buttonTypeApi' == pages.name)) {
          console.info('get buttonType state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push buttonTypeApi page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push buttonType page error ' + JSON.stringify(err));
      }
      done()
    });
    it('buttonType_0200', Level.LEVEL2, async (done: Function) => {
      console.info('buttonType_0200 start');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('key_ButtonType_002');
          console.info('[buttonType_0200]:' + JSON.stringify(JSON.parse(strJson).$attrs.type));
          expect(JSON.parse(strJson).$attrs.type).assertEqual('ButtonType.ROUNDED_RECTANGLE');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('buttonType_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}
