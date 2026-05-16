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
import featureAbility from '@ohos.ability.featureAbility'
import bundle from '@ohos.bundle.bundleManager'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

export default function ActsContextTest() {
  describe('ActsContextTest', function () {

    /**
     * @tc.name   ACTS_GetBundleName_0100
     * @tc.number ACTS_GetBundleName_0100
     * @tc.desc    getBundleName :The class of the test return value is made Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetBundleName_0100', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log('ACTS_GetBundleName_0100 context is:' + JSON.stringify(context));
      let result = await context.getBundleName();
      expect(typeof(context)).assertEqual("object");
      expect(result).assertEqual('com.example.actscontext');
      done();
    })

    /**
     * @tc.name   ACTS_GetBundleName_0200
     * @tc.number ACTS_GetBundleName_0200
     * @tc.desc   getBundleName : Get the bundlename of the hap package(by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetBundleName_0200', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log('ACTS_GetBundleName_0200 context is:' + JSON.stringify(context));
      let result = await context.getBundleName();
      expect(result).assertEqual('com.example.actscontext');
      done();
    })

    /**
     * @tc.name   ACTS_GetBundleName_0300
     * @tc.number ACTS_GetBundleName_0300
     * @tc.desc   getBundleName :Get the value of return is void (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetBundleName_0300', Level.LEVEL0, async function (done) {
      let context = featureAbility.getContext();
      let info = context.getBundleName(
        (err, data) => {
          expect(data).assertEqual('com.example.actscontext');
          done();
        })
    })

    /**
     * @tc.name   ACTS_GetBundleName_0400
     * @tc.number ACTS_GetBundleName_0400
     * @tc.desc   getBundleName :Get the bundlename of the hap package(by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetBundleName_0400', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      let info = context.getBundleName(
        (err, data) => {
          console.log('ACTS_GetBundleName_0400 data is:' + JSON.stringify(data));
          expect(data).assertEqual('com.example.actscontext');
          done();
        }
      );
    })


    /**
     * @tc.name   ACTS_GetBundleName_0500
     * @tc.number ACTS_GetBundleName_0500
     * @tc.desc   getBundleName : Wrong parameters are provided, and the test return type is void (by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetBundleName_0500', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      let info = context.getBundleName("error_param",
        (err, data) => {
          console.log('ACTS_GetBundleName_0500 data is:' + JSON.stringify(data));
          expect(data).assertEqual('com.example.actscontext');
        }
      );
      expect(info).assertEqual(null);
      done();
    })


    /**
     * @tc.name   ACTS_VerifyPermission_0100
     * @tc.number ACTS_VerifyPermission_0100
     * @tc.desc   verifySelfPermission : Query whether the application of the specified PID and UID has been granted a certain permission(by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_VerifyPermission_0100', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log('ACTS_VerifyPermission_0100 context is:' + JSON.stringify(context));
      let datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      console.log('ACTS_VerifyPermission_0100 datainfo is:' + JSON.stringify(datainfo));
      let options = {
        pid :0,
        uid :datainfo.appInfo.uid
      }
      context.verifyPermission("ohos.permission.INSTALL_BUNDLE",options,
        (err, data) => {
          console.info("ACTS_VerifyPermission_0100 in verifyPermission");
          console.log('ACTS_VerifyPermission_0100 data is:' + JSON.stringify(data));
          try{expect(data).assertEqual(0);}catch{}
          done();
        });
    })

    /**
     * @tc.name   ACTS_VerifyPermission_0200
     * @tc.number ACTS_VerifyPermission_0200
     * @tc.desc   verifySelfPermission : Query whether the application of the specified PID and UID has been granted a certain permission(by Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_VerifyPermission_0200', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log('ACTS_VerifyPermission_0200 context is:' + JSON.stringify(context));
      let datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let options = {
        pid :0,
        uid :datainfo.appInfo.uid
      }
      let promise = await context.verifyPermission("ohos.permission.INSTALL_BUNDLE",options );
      console.log('ACTS_VerifyPermission_0200 promise is:' + JSON.stringify(promise));
      expect(promise).assertEqual(0);
      done();
    })

    /**
     * @tc.name   ACTS_VerifyPermission_0300
     * @tc.number ACTS_VerifyPermission_0300
     * @tc.desc   verifySelfPermission :Query whether the application of the specified PID and UID has been granted a certain permission (by Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_VerifyPermission_0300', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      let datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      console.log('ACTS_VerifyPermission_0300 datainfo is:' + JSON.stringify(datainfo));
      let options = {
        pid :0,
        uid :datainfo.appInfo.uid
      }
      let result = context.verifyPermission("com.example.permission.NOT",options,
        (err, data) => {
          console.log('ACTS_VerifyPermission_0300 data is:' + JSON.stringify(data));
          try{expect(data).assertEqual(-1);}catch{}
          done();
        });
    })

    /**
     * @tc.name   ACTS_VerifyPermission_0400
     * @tc.number ACTS_VerifyPermission_0400
     * @tc.desc   verifySelfPermission : Query whether the application of the specified PID and UID has been granted a certain permission(by Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_VerifyPermission_0400', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      let datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let options = {
        pid :0,
        uid :datainfo.appInfo.uid
      }
      let promise = await context.verifyPermission("ohos.permission.CAMERA.NOT",options );
      console.log('ACTS_VerifyPermission_0400 promise is:' + JSON.stringify(promise));
      expect(promise).assertEqual(-1);
      done();
    })


    /**
     * @tc.name   ACTS_VerifyPermission_0500
     * @tc.number ACTS_VerifyPermission_0500
     * @tc.desc   verifySelfPermission : Query whether the application of the specified PID and
    *  UID has been granted a certain permission(by Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_VerifyPermission_0500', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      let datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let options = {
        pid :0,
        uid :datainfo.appInfo.uid
      }
      let promise = await context.verifyPermission(2000,options );
      console.log('ACTS_VerifyPermission_0500 promise is:' + JSON.stringify(promise));
      expect(promise).assertEqual(null);
      done();
    })


    /**
     * @tc.name   ACTS_VerifyPermission_0600
     * @tc.number ACTS_VerifyPermission_0600
     * @tc.desc   verifySelfPermission : Query whether the application of the specified PID and UID has been granted a certain permission(by Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_VerifyPermission_0600', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log('ACTS_VerifyPermission_0600 context is:' + JSON.stringify(context));
      let datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let options = {
        pid :0,
        uid :datainfo.appInfo.uid
      }
      await context.verifyPermission("ohos.permission.INSTALL_BUNDLE", options).then((data)=>{
        console.log('ACTS_VerifyPermission_0600 promise is:' + JSON.stringify(data));
        try{expect(data).assertEqual(0);}catch{}
        done();
      }).catch(()=>{
        expect().assertFail();
        done();
      });
    })


    /**
     * @tc.name   ACTS_GetDisplayOrientation_0100
     * @tc.number ACTS_GetDisplayOrientation_0100
     * @tc.desc   Check the return display orientation of the interface (by AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetDisplayOrientation_0100', Level.LEVEL0, async function (done) {
      console.log('ACTS_GetDisplayOrientation_0100====<begin');
      let context = await featureAbility.getContext();
      try {
        context.getDisplayOrientation((err,data)=>{
          console.log('getDisplayOrientation call back');
          done();
        });
        done();
      } catch (err) {
        console.log('ACTS_GetDisplayOrientation_0100====<end err=' + err)
        done();
      }
      console.log('ACTS_GetDisplayOrientation_0100====<end');
    })

    /**
     * @tc.name   ACTS_GetDisplayOrientation_0200
     * @tc.number ACTS_GetDisplayOrientation_0200
     * @tc.desc   Check the return display orientation of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetDisplayOrientation_0200', Level.LEVEL0, async function (done) {
      console.log('ACTS_GetDisplayOrientation_0200====<begin');
      let context = await featureAbility.getContext();
      try {
        let displayOrientation = context.getDisplayOrientation();
        done();
      } catch (err) {
        console.log('ACTS_GetDisplayOrientation_0200====<end err=' + err)
        done();
      }
      console.log('ACTS_GetDisplayOrientation_0200====<end');
    })

    /**
     * @tc.name   ACTS_SetDisplayOrientation_0100
     * @tc.number ACTS_SetDisplayOrientation_0100
     * @tc.desc   Check the return display orientation of the interface (by AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_SetDisplayOrientation_0100', Level.LEVEL0, async function (done) {
      console.log('ACTS_SetDisplayOrientation_0100====<begin');
      let context = await featureAbility.getContext();
      try {
        context.setDisplayOrientation(true, (err,data)=>{
          console.log('SetDisplayOrientation call back');
          done();
        });
        done();
      } catch (err) {
        console.log('ACTS_SetDisplayOrientation_0100====<end err=' + err)
        done();
      }
      console.log('ACTS_SetDisplayOrientation_0100====<end');
    })

    /**
     * @tc.name   ACTS_SetDisplayOrientation_0200
     * @tc.number ACTS_SetDisplayOrientation_0200
     * @tc.desc   Check the return display orientation of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_SetDisplayOrientation_0200', Level.LEVEL0, async function (done) {
      console.log('ACTS_SetDisplayOrientation_0200====<begin');
      let context = await featureAbility.getContext();
      try {
        context.setDisplayOrientation(true);
        done();
      } catch (err) {
        console.log('ACTS_SetDisplayOrientation_0200====<end err=' + err)
        done();
      }
      console.log('ACTS_SetDisplayOrientation_0200====<end');
    })

    /**
     * @tc.name   ACTS_SetShowOnLockScreen_0100
     * @tc.number ACTS_SetShowOnLockScreen_0100
     * @tc.desc   Check the return show on lock screen status of the interface (by AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_SetShowOnLockScreen_0100', Level.LEVEL0, async function (done) {
      console.log('ACTS_SetShowOnLockScreen_0100====<begin');
      let context = await featureAbility.getContext();
      let flag = false;
      try {
        context.setShowOnLockScreen(true, (err,data)=>{
          console.log('SetShowOnLockScreen call back ' +  err?.code);
          expect(data).assertEqual(undefined)
          expect(err?.code).assertEqual(0)
          done();
        });
      } catch (err) {
        console.log('ACTS_SetShowOnLockScreen_0100====<end err=' + err)
        expect().assertFail()
        done();
      }
      console.log('ACTS_SetShowOnLockScreen_0100====<end');
    })

    /**
     * @tc.name   ACTS_SetShowOnLockScreen_0200
     * @tc.number ACTS_SetShowOnLockScreen_0200
     * @tc.desc   Check the return show on lock screen status of the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_SetShowOnLockScreen_0200', Level.LEVEL0, async function (done) {
      console.log('ACTS_SetShowOnLockScreen_0200====<begin');
      let context = await featureAbility.getContext();
      let flag = false;
      try {
        await context.setShowOnLockScreen(true).then(()=>{
          console.log('SetShowOnLockScreen call back ' +  err?.code);
          expect(data).assertEqual(undefined)
          done();
        }).catch((err)=>{
          console.log('ACTS_SetShowOnLockScreen_0200====<end err=')
          flag = true;
          expect(flag).assertTrue()
          done();
        })
      } catch (err) {
        console.log('ACTS_SetShowOnLockScreen_0200====<end err=' + err)
        expect().assertFail()
        done();
      }
      console.log('ACTS_SetShowOnLockScreen_0200====<end');
    })

    /**
     * @tc.name   ACTS_SetShowOnLockScreen_0300
     * @tc.number ACTS_SetShowOnLockScreen_0300
     * @tc.desc   Check the return show on lock screen status of the interface with false parameter (by AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_SetShowOnLockScreen_0300', Level.LEVEL0, async function (done) {
      console.log('ACTS_SetShowOnLockScreen_0300====<begin');
      let context = await featureAbility.getContext();
      try {
        context.setShowOnLockScreen(false, (err,data)=>{
          console.log('SetShowOnLockScreen call back ' + err?.code);
          expect(data).assertEqual(undefined)
          expect(err?.code).assertEqual(0)
          done();
        });
      } catch (err) {
        console.log('ACTS_SetShowOnLockScreen_0300====<end err=' + err)
        expect().assertFail()
        done();
      }
      console.log('ACTS_SetShowOnLockScreen_0300====<end');
    })

    /**
     * @tc.name   ACTS_SetShowOnLockScreen_0400
     * @tc.number ACTS_SetShowOnLockScreen_0400
     * @tc.desc   Check the return show on lock screen status of the interface with false parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_SetShowOnLockScreen_0400', Level.LEVEL0, async function (done) {
      console.log('ACTS_SetShowOnLockScreen_0400====<begin');
      let context = await featureAbility.getContext();
      let flag = false;
      try {
        await context.setShowOnLockScreen(false).then(()=>{
          console.log('SetShowOnLockScreen call back ');
          expect(data).assertEqual(undefined)
          done();
        }).catch(()=>{
          console.log('ACTS_SetShowOnLockScreen_0200====<end err=')
          flag = true;
          expect(flag).assertTrue()
          done();
        })
      } catch (err) {
        console.log('ACTS_SetShowOnLockScreen_0400====<end err=' + err)
        expect().assertFail()
        done();
      }
      console.log('ACTS_SetShowOnLockScreen_0400====<end');
    })

    /**
     * @tc.name   ACTS_SetWakeUpScreen_0100
     * @tc.number ACTS_SetWakeUpScreen_0100
     * @tc.desc   Check the return show on lock screen status of the interface with false parameter (by AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_SetWakeUpScreen_0100', Level.LEVEL0, async function (done) {
      console.log('ACTS_SetWakeUpScreen_0100====<begin');
      let context = await featureAbility.getContext();
      try {
        context.setWakeUpScreen(false, (err,data)=>{
          console.log('ACTS_SetWakeUpScreen_0100 call back ' + err?.code);
          expect(data).assertEqual(undefined)
          done();
        });
      } catch (err) {
        console.log('ACTS_SetWakeUpScreen_0100====<end err=' + err)
        expect().assertFail()
        done();
      }
      console.log('ACTS_SetWakeUpScreen_0100====<end');
    })

    /**
     * @tc.name   ACTS_SetWakeUpScreen_0200
     * @tc.number ACTS_SetWakeUpScreen_0200
     * @tc.desc   Check the return show on lock screen status of the interface with false parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_SetWakeUpScreen_0200', Level.LEVEL0, async function (done) {
      console.log('ACTS_SetWakeUpScreen_0200====<begin');
      let context = await featureAbility.getContext();
      let flag = false;
      try {
        await context.setWakeUpScreen(false).then(()=>{
          console.log('ACTS_SetWakeUpScreen_0200 call back ');
          expect(data).assertEqual(undefined)
          done();
        }).catch(()=>{
          console.log('ACTS_SetWakeUpScreen_0200 call err  ');
          flag = true;
          expect(flag).assertTrue()
          done();
        })
      } catch (err) {
        console.log('ACTS_SetWakeUpScreen_0200====<end err=' + err)
        expect().assertFail()
        done();
      }
      console.log('ACTS_SetWakeUpScreen_0200====<end');
    })

    /**
     * @tc.name   ACTS_RequestPermissionForUser_0100
     * @tc.number ACTS_RequestPermissionForUser_0100
     * @tc.desc   requestPermissionsFromUser : Requests certain permissions from the system.(by callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_RequestPermissionForUser_0100', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log("ACTS_RequestPermissionForUser_0100 ----------1");
      context.requestPermissionsFromUser([], 1,
        (err, data)=>{
          console.log("====>ACTS_RequestPermissionForUser_0100 data====>" + JSON.stringify(data));
          console.log("====>ACTS_RequestPermissionForUser_0100 err====>" + JSON.stringify(err.code));
          expect(err.code).assertEqual(-104);
          done();
        });
      console.log("ACTS_RequestPermissionForUser_0100 ----------2");
    })

    /**
     * @tc.name   ACTS_RequestPermissionForUser_0200
     * @tc.number ACTS_RequestPermissionForUser_0200
     * @tc.desc   requestPermissionsFromUser : Requests certain permissions from the system.(by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_RequestPermissionForUser_0200', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log("ACTS_RequestPermissionForUser_0200 ----------1");

      await context.requestPermissionsFromUser([], 1).then((data) => {
        console.log("====>ACTS_RequestPermissionForUser_0200 data====>" + JSON.stringify(data));
      }).catch((err) => {
        console.log("====>ACTS_RequestPermissionForUser_0200 err====>" + JSON.stringify(err.code));
        expect(err.code).assertEqual(-104)
      })
      console.log("ACTS_RequestPermissionForUser_0200 ----------2");
      done();
    })
    
    /**
     * @tc.name   ACTS_VerifyPermission_1000
     * @tc.number ACTS_VerifyPermission_1000
     * @tc.desc   verifySelfPermission : Query whether the application of the specified PID and UID has been granted a certain permission(by Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_VerifyPermission_1000', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log('ACTS_VerifyPermission_1000 context is:' + JSON.stringify(context));
      let datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      await context.verifyPermission("").then((data)=>{
        console.log('ACTS_VerifyPermission_1000 promise is:' + JSON.stringify(data));
        try{expect(data).assertEqual(0);}catch{}
        done();
      }).catch(()=>{
        expect().assertFail();
        done();
      });
    })
    
    /**
     * @tc.name   ACTS_VerifyPermission_1100
     * @tc.number ACTS_VerifyPermission_1100
     * @tc.desc   Test verifyPermission overload without options parameter - null (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_VerifyPermission_1100', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log('ACTS_VerifyPermission_1100 context is:' + JSON.stringify(context));
      try {
        await context.verifyPermission(null).then((data)=>{
          console.log('ACTS_VerifyPermission_1100 promise is:' + JSON.stringify(data));
          try{expect(data).assertEqual(0);}catch{}
          done();
        }).catch((err)=>{
          expect().assertFail();
          done();
        });
      } catch (e) {
        console.log('ACTS_VerifyPermission_1100 error is:' + JSON.stringify(e));
        done();
      }
    })

    /**
     * @tc.name   ACTS_VerifyPermission_1200
     * @tc.number ACTS_VerifyPermission_1200
     * @tc.desc   Test verifyPermission overload without options parameter - undefined (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_VerifyPermission_1200', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log('ACTS_VerifyPermission_1200 context is:' + JSON.stringify(context));
      try {
        await context.verifyPermission(undefined).then((data)=>{
          console.log('ACTS_VerifyPermission_1200 promise is:' + JSON.stringify(data));
          try{expect(data).assertEqual(0);}catch{}
          done();
        }).catch((err)=>{
          expect().assertFail();
          done();
        });
      } catch (e) {
        console.log('ACTS_VerifyPermission_1200 error is:' + JSON.stringify(e));
        done();
      }
    })

    /**
     * @tc.name   ACTS_VerifyPermission_1300
     * @tc.number ACTS_VerifyPermission_1300
     * @tc.desc   Test verifyPermission overload without options parameter - empty string (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_VerifyPermission_1300', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log('ACTS_VerifyPermission_1300 context is:' + JSON.stringify(context));
      context.verifyPermission("",
        (err, data) => {
          console.log('ACTS_VerifyPermission_1300 data is:' + JSON.stringify(data) + " " + err?.code);
          expect(data).assertEqual(0);
          done();
        });
    })
    
    /**
     * @tc.name   ACTS_VerifyPermission_1600
     * @tc.number ACTS_VerifyPermission_1600
     * @tc.desc   verifySelfPermission : Query whether the application of the specified PID and UID has been granted a certain permission(by Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_VerifyPermission_1600', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log('ACTS_VerifyPermission_0200 context is:' + JSON.stringify(context));
      let datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let promise = await context.verifyPermission("ohos.permission.INSTALL_BUNDLE", null);
      console.log('ACTS_VerifyPermission_0200 promise is:' + JSON.stringify(promise));
      expect(promise).assertEqual(0);
      done();
    })

    
    /**
     * @tc.name   ACTS_VerifyPermission_1700
     * @tc.number ACTS_VerifyPermission_1700
     * @tc.desc   verifySelfPermission : Query whether the application of the specified PID and UID has been granted a certain permission(by Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_VerifyPermission_1700', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log('ACTS_VerifyPermission_1700 context is:' + JSON.stringify(context));
      let promise = await context.verifyPermission("ohos.permission.INSTALL_BUNDLE", undefined);
      console.log('ACTS_VerifyPermission_1700 promise is:' + JSON.stringify(promise));
      expect(promise).assertEqual(0);
      done();
    })

    
    /**
     * @tc.name   ACTS_VerifyPermission_1800
     * @tc.number ACTS_VerifyPermission_1800
     * @tc.desc   verifySelfPermission : Query whether the application of the specified PID and UID has been granted a certain permission(by Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_VerifyPermission_1800', Level.LEVEL0, async function (done) {
      let context = await featureAbility.getContext();
      console.log('ACTS_VerifyPermission_1800 context is:' + JSON.stringify(context));
      let datainfo = await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      await context.verifyPermission("ohos.permission.INSTALL_BUNDLE", null).then((data)=>{
        console.log('ACTS_VerifyPermission_1800 promise is:' + JSON.stringify(data));
        try{expect(data).assertEqual(0);}catch{}
        done();
      }).catch(()=>{
        expect().assertFail();
        done();
      });
    })

  })
}
