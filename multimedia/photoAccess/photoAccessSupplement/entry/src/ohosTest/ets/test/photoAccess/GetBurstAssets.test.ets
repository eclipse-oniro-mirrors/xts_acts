import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { driveFn, getPermission, sleep } from '../common';
import { common } from '@kit.AbilityKit';
import { dataSharePredicates } from '@kit.ArkData';


const TAG = "PhotoXts.GetBurstAssets";

export default function GetBurstAssets() {
  describe('GetBurstAssets', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(500);
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number    MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_001
     * @tc.name      MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_001
     * @tc.desc      Testing GetBurstAssets
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_001", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_001';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
        await phAccessHelper.getBurstAssets('e719d696-09fa-44f8-8e9e-ec3f215aa62a', null);
        console.info(TAG, testName, 'getBurstAssets success');
        expect().assertFail();
      }
      catch (error){
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual('14000011');
      }
      done();
    })

    /**
     * @tc.number    MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_002
     * @tc.name      MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_002
     * @tc.desc      Testing GetBurstAssets
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_002", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_002';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        await phAccessHelper.getBurstAssets('e719d696-09fa-44f8-8e9e-ec3f215aa62a', undefined );
        console.info(TAG, testName, 'getBurstAssets success');
        expect().assertFail();
      }
      catch (error){
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual('14000011');
      }
      done();
    })

    /**
     * @tc.number    MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_003
     * @tc.name      MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_003
     * @tc.desc      Testing GetBurstAssets
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_003", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_003';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        AppStorage.setOrCreate('key', '');
        let asset: photoAccessHelper.FetchOptions = AppStorage.get('key') as ESObject;
        await phAccessHelper.getBurstAssets('e719d696-09fa-44f8-8e9e-ec3f215aa62a', asset );
        console.info(TAG, testName, 'getBurstAssets success');
        expect().assertFail();
      }
      catch (error){
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual('14000011');
      }
      done();
    })

    /**
     * @tc.number    MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_004
     * @tc.name      MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_004
     * @tc.desc      Testing GetBurstAssets
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_004", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_004';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let result = await phAccessHelper.getBurstAssets('',fetchOptions);
        console.info(TAG, testName, 'getBurstAssets success', result);
        expect(result).assertUndefined();
      }
      catch (error){
        console.error(TAG, testName, error.message, error.code);
        expect().assertFail();
      }
      done();
    })


    /**
     * @tc.number    MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_005
     * @tc.name      MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_005
     * @tc.desc      Testing GetBurstAssets
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_005", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_005';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let result = await phAccessHelper.getBurstAssets(null,fetchOptions);
        console.info(TAG, testName, 'getBurstAssets success', result);
        expect().assertFail();
      }
      catch (error){
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.number    MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_006
     * @tc.name      MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_006
     * @tc.desc      Testing GetBurstAssets
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_006", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_006';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let result = await phAccessHelper.getBurstAssets(undefined,fetchOptions);
        console.info(TAG, testName, 'getBurstAssets success', result);
        expect().assertFail();
      }
      catch (error){
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual('401');
      }
      done();
    })

  })
}
