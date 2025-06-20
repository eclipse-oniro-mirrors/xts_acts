/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import router from '@ohos.router'
import CommonFunc from '../../MainAbility/common/Common';

export default function SwiperOnSelectedTest() {
  describe('SwiperOnSelectedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SwiperOnSelected beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/SwiperOnSelected',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SwiperOnSelected state pages: ' + JSON.stringify(pages));
        if (!('SwiperOnSelected' == pages.name)) {
          console.info('get SwiperOnSelected pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push SwiperOnSelected page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('SwiperOnSelected beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('SwiperOnSelected after each called');
    })

    /**
     * @tc.number SwiperOnSelectedTest0010
     * @tc.name   SwiperOnSelectedTest0010
     * @tc.desc   onSelected
     * @tc.level  Level 1
     * @tc.type
     * @tc.size
     */
    it('SwiperOnSelectedTest0010', Level.LEVEL1, async (done: Function) => {
        let tagName = 'SwiperOnSelectedTest0010';
        console.info('[' + tagName + '] START============================');
        await CommonFunc.sleep(5000);
        let strJson: string = getInspectorByKey('TEXT_0010');
        console.info("[SwiperOnSelectedTest0010] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
        expect(JSON.parse(strJson).$attrs.content).assertEqual("onSelected");
        await CommonFunc.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  
  
      /**
       * @tc.number SwiperOnSelected0020
       * @tc.name   SwiperOnSelected0020
       * @tc.desc   onSelected
       * @tc.level  Level 1
       * @tc.type
       * @tc.size
       */
      it('SwiperOnSelectedTest0020', Level.LEVEL1, async (done: Function) => {
        let tagName = 'SwiperOnSelectedTest0020';
        console.info('[' + tagName + '] START============================');
        await CommonFunc.sleep(5000);
        let strJson: string = getInspectorByKey('TEXT_0020');
        console.info("[SwiperOnSelectedTest0020] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
        expect(JSON.parse(strJson).$attrs.content).assertEqual("onSelected");
        await CommonFunc.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  })
}