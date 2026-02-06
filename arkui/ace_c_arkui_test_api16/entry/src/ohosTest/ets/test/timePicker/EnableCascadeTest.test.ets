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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function TimePickerTest() {

  describe('TimePickerTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   EnableCascadeTest001
     * @tc.number EnableCascadeTest001
     * @tc.desc   TimePicker enableCascade value true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnableCascadeTest001', Level.LEVEL1, async (done: Function) => {
      console.info('EnableCascadeTest001 START');
      let PAGE_TAG = 'EnableCascadeTest';
      await Utils.pushPage(`timePicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('timePicker_001');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[EnableCascadeTest001]markToday:" + JSON.stringify(obj.$attrs.enableCascade));
      await Utils.sleep(1000)
      expect(obj.$attrs.enableCascade).assertEqual(true);
      await Utils.sleep(1000)
      console.info('EnableCascadeTest001 END');
      done();
    })

    /**
     * @tc.name   EnableCascadeTest002
     * @tc.number EnableCascadeTest002
     * @tc.desc   TimePicker enableCascade value false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnableCascadeTest002', Level.LEVEL1, async (done: Function) => {
      console.info('EnableCascadeTest001 START');
      let PAGE_TAG = 'EnableCascadeTest';
      await Utils.pushPage(`timePicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('timePicker_002');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[EnableCascadeTest002]markToday:" + JSON.stringify(obj.$attrs.enableCascade));
      await Utils.sleep(1000)
      expect(obj.$attrs.enableCascade).assertEqual(false);
      await Utils.sleep(1000)
      console.info('EnableCascadeTest002 END');
      done();
    })

    /**
     * @tc.name   EnableCascadeTest003
     * @tc.number EnableCascadeTest003
     * @tc.desc   TimePicker enableCascade value null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnableCascadeTest003', Level.LEVEL1, async (done: Function) => {
      console.info('EnableCascadeTest003 START');
      let PAGE_TAG = 'EnableCascadeTest';
      await Utils.pushPage(`timePicker/${PAGE_TAG}`);
      await Utils.sleep(3000)
      let strJson = getInspectorByKey('timePicker_003');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[EnableCascadeTest003]markToday:" + JSON.stringify(obj.$attrs.enableCascade));
      await Utils.sleep(1000)
      expect(obj.$attrs.enableCascade).assertEqual(false);
      await Utils.sleep(1000)
      console.info('EnableCascadeTest003 END');
      done();
    })
  })
}