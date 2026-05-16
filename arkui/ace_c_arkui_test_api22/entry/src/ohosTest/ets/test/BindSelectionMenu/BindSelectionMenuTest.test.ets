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
import { expect, describe, it, afterEach, beforeEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import nativeFunc from 'libnativefunc.so'
import Utils from '../common/Utils';

export default function BindSelectionMenuTest() {

  describe('BindSelectionMenuTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions01
     * @tc.name    BindSelectionMenuTest001
     * @tc.desc    testing TextSelectionMenuOption CAPI creat & dispose
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions01()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions02
     * @tc.name    BindSelectionMenuTest002
     * @tc.desc    testing TextSelectionMenuOption CAPI SetSpanType success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions02()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions03
     * @tc.name    BindSelectionMenuTest003
     * @tc.desc    testing TextSelectionMenuOption CAPI SetSpanType failed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions03()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions04
     * @tc.name    BindSelectionMenuTest004
     * @tc.desc    testing TextSelectionMenuOption CAPI GetSpanType success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions04()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions05
     * @tc.name    BindSelectionMenuTest005
     * @tc.desc    testing TextSelectionMenuOption CAPI GetSpanType failed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions05()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions06
     * @tc.name    BindSelectionMenuTest006
     * @tc.desc    testing TextSelectionMenuOption CAPI SetContentNode success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions06()).assertEqual(0)
      done()
    })


    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions07
     * @tc.name    BindSelectionMenuTest007
     * @tc.desc    testing TextSelectionMenuOption CAPI SetContentNode failed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions07()).assertEqual(0)
      done()
    })


    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions08
     * @tc.name    BindSelectionMenuTest008
     * @tc.desc    testing TextSelectionMenuOption CAPI GetContentNode success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions08()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions09
     * @tc.name    BindSelectionMenuTest009
     * @tc.desc    testing TextSelectionMenuOption CAPI GetContentNode failed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions09()).assertEqual(0)
      done()
    })


    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions10
     * @tc.name    BindSelectionMenuTest010
     * @tc.desc    testing TextSelectionMenuOption CAPI SetResponseType success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions10()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions11
     * @tc.name    BindSelectionMenuTest011
     * @tc.desc    testing TextSelectionMenuOption CAPI SetResponseType failed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions11()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions12
     * @tc.name    BindSelectionMenuTest012
     * @tc.desc    testing TextSelectionMenuOption CAPI GetResponseType success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions12()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions13
     * @tc.name    BindSelectionMenuTest013
     * @tc.desc    testing TextSelectionMenuOption CAPI GetResponseType failed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions13()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions14
     * @tc.name    BindSelectionMenuTest014
     * @tc.desc    testing TextSelectionMenuOption CAPI RegisterOnMenuShowCallback success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions14()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions15
     * @tc.name    BindSelectionMenuTest015
     * @tc.desc    testing TextSelectionMenuOption CAPI RegisterOnMenuShowCallback failed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions15()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions16
     * @tc.name    BindSelectionMenuTest016
     * @tc.desc    testing TextSelectionMenuOption CAPI RegisterOnMenuHideCallback success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions16()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextSelectionMenuOptions17
     * @tc.name    BindSelectionMenuTest017
     * @tc.desc    testing TextSelectionMenuOption CAPI RegisterOnMenuHideCallback failed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('BindSelectionMenuTest017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextSelectionMenuOptions17()).assertEqual(0)
      done()
    })
    
  })
}
