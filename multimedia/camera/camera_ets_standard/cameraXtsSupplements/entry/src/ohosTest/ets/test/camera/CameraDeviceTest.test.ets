import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { camera } from '@kit.CameraKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { driveFn, getPermission, isEmpty } from '../common';

const TAG = "CameraXts.getCameraDevice";
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;

function getCameraManager(): camera.CameraManager | undefined {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    mCameraManager = camera.getCameraManager(testContext);
  } catch (error) {
    let err = error as BusinessError;
    console.error(`The getCameraManager call failed. error code: ${err.code}`);
  }
  return mCameraManager;
}

function getSupportedCameraDeviceArray() {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager.getSupportedCameras();
  if (isEmpty(mCameraDeviceArray)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray.length);
  return true;
}


export default function CameraDeviceTest() {
  describe('getCameraDeviceTest', () => {

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      getCameraManager();
      getSupportedCameraDeviceArray();
    });

    beforeEach(() => {
      console.info('afterEach case');
    });

    afterEach(async () => {
      console.info('afterEach case');

    });

    afterAll(async () => {
      console.info('afterAll case');

    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_001
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_001
     * @tc.desc   CAMERA_POSITION_UNSPECIFIED and CAMERA_TYPE_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_001',Level.LEVEL1, async () => {
      const testName = 'test001_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        let type = camera.CameraType.CAMERA_TYPE_DEFAULT;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_002
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_002
     * @tc.desc   CAMERA_POSITION_UNSPECIFIED and CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_002',Level.LEVEL1, async () => {
      const testName = 'test002_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_003
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_003
     * @tc.desc   CAMERA_POSITION_UNSPECIFIED and CAMERA_TYPE_ULTRA_WIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_003',Level.LEVEL1, async () => {
      const testName = 'test003_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_004
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_004
     * @tc.desc   CAMERA_POSITION_UNSPECIFIED and CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_004', Level.LEVEL1, async () => {
      const testName = 'test004_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_005
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_005
     * @tc.desc   CAMERA_POSITION_UNSPECIFIED and CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_005', Level.LEVEL1, async () => {
      const testName = 'test005_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_006
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_006
     * @tc.desc   CAMERA_POSITION_BACK and CAMERA_TYPE_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_006', Level.LEVEL1, async () => {
      const testName = 'test006_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        let type = camera.CameraType.CAMERA_TYPE_DEFAULT;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_007
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_007
     * @tc.desc   CAMERA_POSITION_BACK and CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_007', Level.LEVEL1, async () => {
      const testName = 'test007_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK ;
        let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_008
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_008
     * @tc.desc   CAMERA_POSITION_BACK and CAMERA_TYPE_ULTRA_WIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_008', Level.LEVEL1, async () => {
      const testName = 'test008_getAvailableCameras'
      try {
        let position = camera.CameraPosition. CAMERA_POSITION_BACK;
        let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_009
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_009
     * @tc.desc   CAMERA_POSITION_BACK and CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_009',Level.LEVEL1, async () => {
      const testName = 'test009_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_010
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_010
     * @tc.desc   CAMERA_POSITION_BACK and CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_010', Level.LEVEL1, async () => {
      const testName = 'test010_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_011
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_011
     * @tc.desc   CAMERA_POSITION_FRONT and CAMERA_TYPE_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_011', Level.LEVEL1, async () => {
      const testName = 'test011_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        let type = camera.CameraType.CAMERA_TYPE_DEFAULT;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_012
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_012
     * @tc.desc   CAMERA_POSITION_FRONT and CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_012', Level.LEVEL1, async () => {
      const testName = 'test012_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_013
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_013
     * @tc.desc   CAMERA_POSITION_FRONT and CAMERA_TYPE_ULTRA_WIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_013',Level.LEVEL1, async () => {
      const testName = 'test013_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_014
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_014
     * @tc.desc   CAMERA_POSITION_FRONT and CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_014',Level.LEVEL1, async () => {
      const testName = 'test014_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_015
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_015
     * @tc.desc   CAMERA_POSITION_FRONT and CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_015', Level.LEVEL1, async () => {
      const testName = 'test015_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_016
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_016
     * @tc.desc   CAMERA_POSITION_FOLD_INNER and CAMERA_TYPE_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_016', Level.LEVEL1, async () => {
      const testName = 'test016_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
        let type = camera.CameraType.CAMERA_TYPE_DEFAULT;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_017
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_017
     * @tc.desc   CAMERA_POSITION_FOLD_INNER and CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_017', Level.LEVEL1, async () => {
      const testName = 'test017_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
        let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_018
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_018
     * @tc.desc   CAMERA_POSITION_FOLD_INNER and CAMERA_TYPE_ULTRA_WIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_018', Level.LEVEL1, async () => {
      const testName = 'test018_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
        let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_019
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_019
     * @tc.desc   CAMERA_POSITION_FOLD_INNER and CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_019', Level.LEVEL1, async () => {
      const testName = 'test019_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
        let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_020
     * @tc.number SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_020
     * @tc.desc   CAMERA_POSITION_FOLD_INNER and CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_GET_CAMERA_DEVICE_020',Level.LEVEL1, async () => {
      const testName = 'test020_getAvailableCameras'
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
        let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
        for (let index = 0; index < mCameraDeviceArray.length; index++) {
          const camera = mCameraDeviceArray[index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            expect(device.cameraPosition).assertEqual(position);
            expect(device.cameraType).assertEqual(type);
          }
        }
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect().assertFail();
      }
    });
  })
}

