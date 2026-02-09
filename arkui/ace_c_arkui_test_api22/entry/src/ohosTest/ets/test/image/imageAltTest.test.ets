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
import { expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

const SLEEP_TIME = 1000;

export default function ImageAltTest(){

  describe('ImageAltTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   imageAltTest001
     * @tc.number imageAltTest001
     * @tc.desc   Test the alt interface to set normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageAltTest001', Level.LEVEL1, async (done: Function) => {
      console.info('imageAltTest001 START');
      let PAGE_TAG = 'imageAltTest';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      await Utils.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('image001');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(SLEEP_TIME);
      console.info("[imageAltTest001]:" + JSON.stringify(obj.$attrs.altPlaceholder));
      console.info("[imageAltTest001]:" + JSON.stringify(obj.$attrs.altError));
      expect(obj.$attrs.altPlaceholder).assertEqual('./resources/base/media/icon.png');
      expect(obj.$attrs.altError).assertEqual('./resources/base/media/fail.png');
      await Utils.sleep(SLEEP_TIME);
      console.info('imageAltTest001 END');
      done();
    });

    /**
     * @tc.name   imageAltTest002
     * @tc.number imageAltTest002
     * @tc.desc   Test the alt interface to set normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('imageAltTest002', Level.LEVEL1, async (done: Function) => {
      console.info('imageAltTest002 START');
      let PAGE_TAG = 'imageAltTest';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      await Utils.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('image002');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(SLEEP_TIME);
      console.info("[imageAltTest002]:" + JSON.stringify(obj.$attrs.altPlaceholder));
      console.info("[imageAltTest002]:" + JSON.stringify(obj.$attrs.altError));
      expect(obj.$attrs.altPlaceholder).assertEqual('');
      expect(obj.$attrs.altError).assertEqual('');
      await Utils.sleep(SLEEP_TIME);
      console.info('imageAltTest002 END');
      done();
    });
  })
}