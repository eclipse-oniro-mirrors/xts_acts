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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function buttonLabelTest() {

  describe('ButtonLabelTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_BUTTON_LABEL_0100
     * @tc.name: testButtonLabel001
     * @tc.desc: testing label for button with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testButtonLabel001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ButtonLabel001Test';
      await Utils.pushPage(`button/${PAGE_TAG}`);
      expect(JSON.parse(getInspectorByKey('button001')).$attrs.label).assertEqual('label')
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_BUTTON_LABEL_0200
     * @tc.name: testButtonLabel002
     * @tc.desc: testing label for button with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testButtonLabel002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ButtonLabel002Test';
      await Utils.pushPage(`button/${PAGE_TAG}`);
      expect(JSON.parse(getInspectorByKey('button002')).$attrs.label).assertEqual('longlonglonglonglonglonglonglong' +
        'longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong')
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_BUTTON_LABEL_0300
     * @tc.name: testButtonLabel003
     * @tc.desc: testing label for button with NULL value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testButtonLabel003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ButtonLabel003Test';
      await Utils.pushPage(`button/${PAGE_TAG}`);
      expect(JSON.parse(getInspectorByKey('button003')).$attrs.label).assertEqual('')
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_BUTTON_LABEL_0400
     * @tc.name: testButtonLabel004
     * @tc.desc: testing label for button with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testButtonLabel004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ButtonLabel004Test';
      await Utils.pushPage(`button/${PAGE_TAG}`);
      expect(JSON.parse(getInspectorByKey('button004')).$attrs.width).assertEqual('100.00vp')
      done()
    })

  })
}