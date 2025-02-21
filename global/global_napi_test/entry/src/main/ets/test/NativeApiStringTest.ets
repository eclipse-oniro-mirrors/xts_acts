// @ts-nocheck
/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'
import resManager from '@ohos.resourceManager'
import ndk from 'libresmgrndk.so'

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getResourceManager_ndktest_0100', 0, async (done: Function) => {
      console.log("getResourceManager_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getResourceManager_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getResourceManager_ndktest_0100 22");
        let value = ndk.GetFileList(mgr, "test");
        console.log("getResourceManager_ndktest_0100 3");
        console.log("getResourceManager_ndktest_0100" + value);
        console.log("getResourceManager_ndktest_0100" + value.length);
        expect(value.length > 0).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_NDK_0200
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getResourceManager_ndktest_0200', 0, async (done: Function) => {
      console.log("getResourceManager_ndktest_0200 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getResourceManager_ndktest_0200 2");
        expect(mgr !== null).assertTrue();
        console.log("getResourceManager_ndktest_0200 22");
        let value = ndk.GetRawFileContent(mgr, "test/aa.xml");
        console.log("getResourceManager_ndktest_0200 3");
        console.log("getResourceManager_ndktest_0200" + value);
        expect(value !== null).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_NDK_0300
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getResourceManager_ndktest_0300', 0, async (done: Function) => {
      console.log("getResourceManager_ndktest_0300 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getResourceManager_ndktest_0300 2");
        expect(mgr !== null).assertTrue();
        console.log("getResourceManager_ndktest_0300 22");
        let value = ndk.GetRawFileDescriptor(mgr, "test/aa.xml");
        console.log("getResourceManager_ndktest_0300 3");
        console.log("getResourceManager_ndktest_0300" + value.fd);
        console.log("getResourceManager_ndktest_0300" + value.offset);
        console.log("getResourceManager_ndktest_0300" + value.length);
        expect(value !== null).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_NDK_0400
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getResourceManager_ndktest_0400', 0, async (done: Function) => {
      console.log("getResourceManager_ndktest_0400 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getResourceManager_ndktest_0400 2");
        expect(mgr !== null).assertTrue();
        console.log("getResourceManager_ndktest_0400 22");
        let value = ndk.GetRawFileDescriptor64(mgr, "test/aa.xml");
        console.log("getResourceManager_ndktest_0400 3");
        console.log("getResourceManager_ndktest_0400" + value);
        expect(value !== null).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_NDK_0500
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getResourceManager_ndktest_0500', 0, async (done: Function) => {
      console.log("getResourceManager_ndktest_0500 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getResourceManager_ndktest_0500 2");
        expect(mgr !== null).assertTrue();
        console.log("getResourceManager_ndktest_0500 22");
        let value = ndk.GetRawFileDescriptor64(mgr, "test/aa.xml");
        console.log("getResourceManager_ndktest_0500 3");
        console.log("getResourceManager_ndktest_0500" + value.fd);
        console.log("getResourceManager_ndktest_0500" + value.offset);
        console.log("getResourceManager_ndktest_0500" + value.length);
        expect(value !== null).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_isRawDir_NDK_0100
    * @tc.name      : isRawDir_ndktest_0100
    * @tc.desc      : isRawDir with null
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('isRawDir_ndktest_0100', 0, async (done: Function) => {
      console.log("isRawDir_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("isRawDir_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("isRawDir_ndktest_0100 22");
        let value = ndk.IsRawDir(resManager.getResourceManager(), '');
        console.log("isRawDir_ndktest_0100 3");
        console.log("isRawDir_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_SUB_GLOBAL_getDrawableDescriptor_NDK_0100isRawDir_NDK_0100
    * @tc.name      : getDrawableDescriptor_ndktest_0100
    * @tc.desc      : getDrawableDescriptor with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getDrawableDescriptor_ndktest_0100', 0, async (done: Function) => {
      console.log("getDrawableDescriptor_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getDrawableDescriptor_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getDrawableDescriptor_ndktest_0100 22");
        let value = ndk.GetDrawableDescriptor(resManager.getResourceManager(), $r('app.media.icon').id);
        console.log("getDrawableDescriptor_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getDrawableDescriptorByName_NDK_0100
    * @tc.name      : getDrawableDescriptorByName_ndktest_0100
    * @tc.desc      : getDrawableDescriptorByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getDrawableDescriptorByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getDrawableDescriptorByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getDrawableDescriptorByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getDrawableDescriptorByName_ndktest_0100 22");
        let value = ndk.GetDrawableDescriptorByName(resManager.getResourceManager());
        console.log("getDrawableDescriptorByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaBase64_NDK_0100
    * @tc.name      : getMediaBase64_ndktest_0100
    * @tc.desc      : getMediaBase64 with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getMediaBase64_ndktest_0100', 0, async (done: Function) => {
      console.log("getMediaBase64_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getMediaBase64_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getMediaBase64_ndktest_0100 22");
        let value = ndk.GetMediaBase64(resManager.getResourceManager(), $r('app.media.icon').id);
        console.log("getMediaBase64_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaBase64ByName_NDK_0100
    * @tc.name      : getMediaBase64ByName_ndktest_0100
    * @tc.desc      : getMediaBase64ByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getMediaBase64ByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getMediaBase64ByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getMediaBase64ByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getMediaBase64ByName_ndktest_0100 22");
        let value = ndk.GetMediaBase64ByName(resManager.getResourceManager());
        console.log("getMediaBase64ByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMedia_NDK_0100
    * @tc.name      : getMedia_ndktest_0100
    * @tc.desc      : getMedia with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getMedia_ndktest_0100', 0, async (done: Function) => {
      console.log("getMedia_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getMedia_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getMedia_ndktest_0100 22");
        let value = ndk.GetMedia(resManager.getResourceManager(), $r('app.media.icon').id);
        console.log("getMedia_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaByName_NDK_0100
    * @tc.name      : getMediaByName_ndktest_0100
    * @tc.desc      : getMediaByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getMediaByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getMediaByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getMediaByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getMediaByName_ndktest_0100 22");
        let value = ndk.GetMediaByName(resManager.getResourceManager());
        console.log("getMediaByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getSymbolByName_NDK_0100
    * @tc.name      : getSymbolByName_ndktest_0100
    * @tc.desc      : getSymbolByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getSymbolByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getSymbolByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getSymbolByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getSymbolByName_ndktest_0100 22");
        let value = ndk.GetSymbolByName(resManager.getResourceManager());
        console.log("getSymbolByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getSymbol_NDK_0100
    * @tc.name      : getSymbol_ndktest_0100
    * @tc.desc      : getSymbol with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getSymbol_ndktest_0100', 0, async (done: Function) => {
      console.log("getSymbol_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getSymbol_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getSymbol_ndktest_0100 22");
        let value = ndk.GetSymbol(resManager.getResourceManager(), $r('app.symbol.symbol_test').id);
        console.log("getSymbol_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getBoolByName_NDK_0100
    * @tc.name      : getBoolByName_ndktest_0100
    * @tc.desc      : getBoolByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getBoolByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getBoolByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getBoolByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getBoolByName_ndktest_0100 22");
        let value = ndk.GetBoolByName(resManager.getResourceManager());
        console.log("getBoolByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getBool_NDK_0100
    * @tc.name      : getBool_ndktest_0100
    * @tc.desc      : getBool with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getBool_ndktest_0100', 0, async (done: Function) => {
      console.log("getBool_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getBool_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getBool_ndktest_0100 22");
        let value = ndk.GetBool(resManager.getResourceManager(), $r('app.boolean.boolean_1').id);
        console.log("getBool_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getPluralStringByName_NDK_0100
    * @tc.name      : getPluralStringByName_ndktest_0100
    * @tc.desc      : getPluralStringByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getPluralStringByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getPluralStringByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getPluralStringByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getPluralStringByName_ndktest_0100 22");
        let value = ndk.GetPluralStringByName(resManager.getResourceManager());
        console.log("getPluralStringByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getPluralString_NDK_0100
    * @tc.name      : getPluralString_ndktest_0100
    * @tc.desc      : getPluralString with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getPluralString_ndktest_0100', 0, async (done: Function) => {
      console.log("getPluralString_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getPluralString_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getPluralString_ndktest_0100 22");
        let value = ndk.GetPluralString(resManager.getResourceManager(), $r('app.plural.eat_apple').id, 1);
        console.log("getPluralString_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getColorByName_NDK_0100
    * @tc.name      : getColorByName_ndktest_0100
    * @tc.desc      : getColorByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getColorByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getColorByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getColorByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getColorByName_ndktest_0100 22");
        let value = ndk.GetColorByName(resManager.getResourceManager());
        console.log("getColorByName_ndktest_0100" + value);
        expect(value).assertEqual(4294967210);
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getColor_NDK_0100
    * @tc.name      : getColor_ndktest_0100
    * @tc.desc      : getColor with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getColor_ndktest_0100', 0, async (done: Function) => {
      console.log("getColor_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getColor_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getColor_ndktest_0100 22");
        let value = ndk.GetColor(resManager.getResourceManager(), $r('app.color.start_window_background_jjq').id);
        console.log("getColor_ndktest_0100" + value);
        expect(value).assertEqual(4294967210);
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getIntByName_NDK_0100
    * @tc.name      : getIntByName_ndktest_0100
    * @tc.desc      : getIntByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getIntByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getIntByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getIntByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getIntByName_ndktest_0100 22");
        let value = ndk.GetIntByName(resManager.getResourceManager());
        console.log("getIntByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getInt_NDK_0100
    * @tc.name      : getInt_ndktest_0100
    * @tc.desc      : getInt with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getInt_ndktest_0100', 0, async (done: Function) => {
      console.log("getInt_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getInt_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getInt_ndktest_0100 22");
        let value = ndk.GetInt(resManager.getResourceManager(), $r('app.integer.integer_1').id);
        console.log("getInt_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getFloatByName_NDK_0100
    * @tc.name      : getFloatByName_ndktest_0100
    * @tc.desc      : getFloatByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getFloatByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getFloatByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getFloatByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getFloatByName_ndktest_0100 22");
        let value = ndk.GetFloatByName(resManager.getResourceManager());
        console.log("getFloatByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getFloat_NDK_0100
    * @tc.name      : getFloat_ndktest_0100
    * @tc.desc      : getFloat with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getFloat_ndktest_0100', 0, async (done: Function) => {
      console.log("getFloat_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getFloat_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getFloat_ndktest_0100 22");
        let value = ndk.GetFloat(resManager.getResourceManager(), $r('app.float.float_1').id);
        console.log("getFloat_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getLocales_NDK_0100
    * @tc.name      : getLocales_ndktest_0100
    * @tc.desc      : getLocales with object
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getLocales_ndktest_0100', 0, async (done: Function) => {
      console.log("getLocales_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getLocales_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getLocales_ndktest_0100 22");
        let value = ndk.GetLocales(resManager.getResourceManager());
        console.log("getLocales_ndktest_0100" + value);
        expect('' + value).assertEqual('en-US,zh-CN');
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getConfiguration_NDK_0100
    * @tc.name      : getConfiguration_ndktest_0100
    * @tc.desc      : getConfiguration with object
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getConfiguration_ndktest_0100', 0, async (done: Function) => {
      console.log("getConfiguration_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getConfiguration_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getConfiguration_ndktest_0100 22");
        let value = ndk.GetConfiguration(resManager.getResourceManager());
        console.log("getConfiguration_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getStringArray_NDK_0100
    * @tc.name      : getStringArray_ndktest_0100
    * @tc.desc      : getStringArray with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getStringArray_ndktest_0100', 0, async (done: Function) => {
      console.log("getStringArray_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getStringArray_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getStringArray_ndktest_0100 22");
        let value = ndk.GetStringArray(resManager.getResourceManager(), $r('app.strarray.size').id);
        console.log("getStringArray_ndktest_0100" + value);
        expect('' + value).assertEqual('small,big');
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getStringArrayByName_NDK_0100
    * @tc.name      : getStringArrayByName_ndktest_0100
    * @tc.desc      : getStringArrayByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getStringArrayByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getStringArrayByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getStringArrayByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getStringArrayByName_ndktest_0100 22");
        let value = ndk.GetStringArrayByName(resManager.getResourceManager());
        console.log("getStringArrayByName_ndktest_0100" + value);
        expect('' + value).assertEqual('small,big');
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_releaseStringArray_NDK_0100
    * @tc.name      : releaseStringArray_ndktest_0100
    * @tc.desc      : releaseStringArray with object
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('releaseStringArray_ndktest_0100', 0, async (done: Function) => {
      console.log("releaseStringArray_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("releaseStringArray_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("releaseStringArray_ndktest_0100 22");
        let value = ndk.ReleaseStringArray(resManager.getResourceManager());
        console.log("releaseStringArray_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_releaseConfiguration_NDK_0100
    * @tc.name      : releaseConfiguration_ndktest_0100
    * @tc.desc      : releaseConfiguration with object
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('releaseConfiguration_ndktest_0100', 0, async (done: Function) => {
      console.log("releaseConfiguration_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("releaseConfiguration_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("releaseConfiguration_ndktest_0100 22");
        let value = ndk.ReleaseConfiguration(resManager.getResourceManager());
        console.log("releaseConfiguration_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getStringByName_NDK_0100
    * @tc.name      : getStringByName_ndktest_0100
    * @tc.desc      : getStringByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getStringByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getStringByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getStringByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getStringByName_ndktest_0100 22");
        let value = ndk.GetStringByName(resManager.getResourceManager());
        console.log("getStringByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getString_NDK_0100
    * @tc.name      : getString_ndktest_0100
    * @tc.desc      : getString with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getString_ndktest_0100', 0, async (done: Function) => {
      console.log("getString_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getString_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getString_ndktest_0100 22");
        let value = ndk.GetString(resManager.getResourceManager(), $r('app.string.entry_MainAbility').id);
        console.log("getString_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getRawFileDescriptorData_NDK_0100
    * @tc.name      : getRawFileDescriptorData_ndktest_0100
    * @tc.desc      : getRawFileDescriptorData with normal xml
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getRawFileDescriptorData_ndktest_0100', 0, async (done: Function) => {
      console.log("getRawFileDescriptorData_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getRawFileDescriptorData_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getRawFileDescriptorData_ndktest_0100 22");
        let value = ndk.GetRawFileDescriptorData(resManager.getResourceManager(), "test/aa.xml");
        console.log("getRawFileDescriptorData_ndktest_0100" + value);
        expect(value.length).assertLarger(0);
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getLocalesData_NDK_0100
    * @tc.name      : getLocalesData_ndktest_0100
    * @tc.desc      : getLocalesData with object
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getLocalesData_ndktest_0100', 0, async (done: Function) => {
      console.log("getLocalesData_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getLocalesData_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getLocalesData_ndktest_0100 22");
        let value = ndk.GetLocalesData(resManager.getResourceManager());
        console.log("getLocalesData_ndktest_0100" + value);
        expect(value != null).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaBase64DataByName_NDK_0100
    * @tc.name      : getMediaBase64DataByName_ndktest_0100
    * @tc.desc      : getMediaBase64DataByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getMediaBase64DataByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getMediaBase64DataByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getMediaBase64DataByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getMediaBase64DataByName_ndktest_0100 22");
        let value = ndk.GetMediaBase64DataByName(resManager.getResourceManager(), "icon");
        console.log("getMediaBase64DataByName_ndktest_0100" + value);
        expect(value != null).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaBase64Data_NDK_0100
    * @tc.name      : getMediaBase64Data_ndktest_0100
    * @tc.desc      : getMediaBase64Data with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getMediaBase64Data_ndktest_0100', 0, async (done: Function) => {
      console.log("getMediaBase64Data_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getMediaBase64Data_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getMediaBase64Data_ndktest_0100 22");
        let value = ndk.GetMediaBase64Data(resManager.getResourceManager(), $r('app.media.icon').id);
        console.log("getMediaBase64Data_ndktest_0100" + value);
        expect(value != null).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaData_NDK_0100
    * @tc.name      : getMediaData_ndktest_0100
    * @tc.desc      : getMediaData with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getMediaData_ndktest_0100', 0, async (done: Function) => {
      console.log("getMediaData_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getMediaData_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getMediaData_ndktest_0100 22");
        let value = ndk.GetMediaData(resManager.getResourceManager(), $r('app.media.icon').id);
        console.log("getMediaData_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getMediaDataByName_NDK_0100
    * @tc.name      : getMediaDataByName_ndktest_0100
    * @tc.desc      : getMediaDataByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getMediaDataByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getMediaDataByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getMediaDataByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getMediaDataByName_ndktest_0100 22");
        let value = ndk.GetMediaDataByName(resManager.getResourceManager(), "icon");
        console.log("getMediaDataByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getDrawableDescriptorData_NDK_0100
    * @tc.name      : getDrawableDescriptorData_ndktest_0100
    * @tc.desc      : getDrawableDescriptorData with normal id
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getDrawableDescriptorData_ndktest_0100', 0, async (done: Function) => {
      console.log("getDrawableDescriptorData_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getDrawableDescriptorData_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getDrawableDescriptorData_ndktest_0100 22");
        let value = ndk.GetDrawableDescriptorData(resManager.getResourceManager(), $r('app.media.icon').id);
        console.log("getDrawableDescriptorData_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_getDrawableDescriptorDataByName_NDK_0100
    * @tc.name      : getDrawableDescriptorDataByName_ndktest_0100
    * @tc.desc      : getDrawableDescriptorDataByName with normal name
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('getDrawableDescriptorDataByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getDrawableDescriptorDataByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getDrawableDescriptorDataByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getDrawableDescriptorDataByName_ndktest_0100 22");
        let value = ndk.GetDrawableDescriptorDataByName(resManager.getResourceManager(), "icon");
        console.log("getDrawableDescriptorDataByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_addResource_NDK_0100
    * @tc.name      : addResource_ndktest_0100
    * @tc.desc      : addResource with null
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('addResource_ndktest_0100', 0, async (done: Function) => {
      console.log("addResource_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("addResource_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("addResource_ndktest_0100 22");
        let value = ndk.AddResource(resManager.getResourceManager(), "");
        console.log("addResource_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number    : SUB_GLOBAL_removeResource_NDK_0100
    * @tc.name      : removeResource_ndktest_0100
    * @tc.desc      : removeResource with null
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('removeResource_ndktest_0100', 0, async (done: Function) => {
      console.log("removeResource_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("removeResource_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("removeResource_ndktest_0100 22");
        let value = ndk.RemoveResource(resManager.getResourceManager(), "");
        console.log("removeResource_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

  })
}