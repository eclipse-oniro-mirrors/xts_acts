import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';

export function isSupportedCameras() : boolean {
  const cameraAvailable = canIUse('SystemCapability.Multimedia.Camera.Core');
  let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext

  let isSupportedCameras = true;
  let isSupportedCameraManager = false;
  let mCameraManager: camera.CameraManager;
  let mCameraDevicesArray: Array<camera.CameraDevice>;

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  console.info('Enter getCameraManagerInstance');
  try {
    mCameraManager = camera.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.info("getCameraManager FAILED");
      isSupportedCameraManager = false;
      return isSupportedCameraManager;
    }
    console.info('Exit getCameraManagerInstance');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty(mCameraDevicesArray)) {
      isSupportedCameras = false;
    }
  } catch (err) {
    console.error("getCameraManager FAILED. errorMessage:", err);
    isSupportedCameraManager = false;
    return isSupportedCameraManager;
  }
  if (cameraAvailable && isSupportedCameras) {
    isSupportedCameraManager = true;
  } else {
    isSupportedCameraManager = false;
  }
  return isSupportedCameraManager;
}