import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { driveFn, getPermission, isEmpty, sleep } from '../common';
import { common, ErrorCode } from '@kit.AbilityKit';
import { dataSharePredicates } from '@kit.ArkData';

const TAG = "PhotoXts.GetPhotoAccessHelper";

export default function getPhotoAccessHelper() {
  describe('getPhotoAccessHelper', () => {
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
     * @tc.number    MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_001
     * @tc.name      MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_001
     * @tc.desc      Testing GetPhotoAccessHelper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_001", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_001';
      try {
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(null);
        console.info(TAG, testName, 'getPhotoAccessHelper success',phAccessHelper);
        expect(isEmpty(phAccessHelper)).assertFalse();
      } catch (error) {
        console.error(TAG, testName,'Error message:' ,error.message, 'Error code:' ,error.code,error);
        expect().assertFail();
      }
      done();
    })


    /**
     * @tc.number    MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_002
     * @tc.name      MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_002
     * @tc.desc      Testing GetPhotoAccessHelper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_002", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_002';
      try {
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(undefined);
        console.info(TAG, testName, 'GetPhotoAccessHelper success',phAccessHelper);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertUndefined();
      }
      done();
    })
    /**
     * @tc.number    MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_003
     * @tc.name      MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_003
     * @tc.desc      Testing GetPhotoAccessHelper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_003", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_003';
      AppStorage.setOrCreate('key', '');
      let asset:Context = AppStorage.get('key') as ESObject;
      try {
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(asset);
        console.info(TAG, testName, 'GetPhotoAccessHelper success',phAccessHelper);
        expect(isEmpty(phAccessHelper)).assertFalse();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect().assertFail();
      }
      done();
    })


    /**
     * @tc.number    MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_004
     * @tc.name      MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_004
     * @tc.desc      Testing GetBurstAsset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_004", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_004';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assert = await phAccessHelper.getBurstAssets('',fetchOptions );
        console.info(TAG, testName, 'getBurstAssets success',assert.getCount());
        expect().assertFail();
      }
      catch (error){
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertUndefined();
      }
      done();
    })

    /**
     * @tc.number    MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_005
     * @tc.name      MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_005
     * @tc.desc      Testing GetBurstAsset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_005", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_005';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        await phAccessHelper.getBurstAssets(null,fetchOptions );
        console.info(TAG, testName, 'getBurstAssets success',phAccessHelper);
        expect().assertFail();
      }
      catch (error){
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.number    MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_006
     * @tc.name      MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_006
     * @tc.desc      Testing GetBurstAsset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_006", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_kIT_OVERWRITE_NULL_PHOTO_ASSETS_006';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        await phAccessHelper.getBurstAssets(undefined,fetchOptions );
        console.info(TAG, testName, 'getBurstAssets success',phAccessHelper);
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