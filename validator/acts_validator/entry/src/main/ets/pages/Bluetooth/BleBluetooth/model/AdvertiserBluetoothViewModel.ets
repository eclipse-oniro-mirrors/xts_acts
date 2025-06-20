/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import ble from '@ohos.bluetooth.ble';
import promptAction from '@ohos.promptAction';
import BleConstants from './BleConstants';
import Log from '../../../model/Logger';
import ArrayBufferUtils from '../util/ArrayBufferUtils';
import access from '@ohos.bluetooth.access';
import connection from '@ohos.bluetooth.connection';
import constant from '@ohos.bluetooth.constant';

const TAG = '[Sample_AdvertiserBluetoothViewModel]';

export class AdvertiserBluetoothViewModel {
  private mGattServer: ble.GattServer;

  isBluetoothEnabled(): boolean {
    Log.info(TAG, `isBluetoothEnabled`);
    let state: access.BluetoothState = access.getState();
    Log.info(TAG, `isBluetoothEnabled: state = ${state}`);
    if (state === access.BluetoothState.STATE_ON || state === access.BluetoothState.STATE_TURNING_ON) {
      return true;
    }
    return false;
  }

  enableBluetooth() {
    Log.info(TAG, `enableBluetooth`);
    try {
      this.onBTStateChange();
      access.enableBluetooth();
    } catch (err) {
      Log.error(TAG, `enableBluetooth: err = ${err}`);
    }
  }

  disableBluetooth() {
    Log.info(TAG, `disableBluetooth`);
    try {
      this.offBTStateChange();
      access.disableBluetooth();
    } catch (err) {
      Log.error(TAG, `disableBluetooth: err = ${err}`);
    }
  }

  getLocalName(): string {
    let localName = '';
    try {
      localName = connection.getLocalName();
      Log.info(TAG, `getLocalName: localName = ${localName}`);
    } catch (err) {
      Log.error(TAG, `getLocalName: err = ${err}`);
    }
    return localName;
  }

  startAdvertiser(): boolean {
    Log.info(TAG, `startAdvertiser`);

    if (!this.isBluetoothEnabled()) {
      Log.info(TAG, `startBLEScan: bluetooth is disable.`);
      this.enableBluetooth();
      promptAction.showToast({
        message: '正在开启蓝牙请稍后',
        duration: 2000
      });
      return false;
    }

    this.mGattServer = ble.createGattServer();

    let descriptors: Array<ble.BLEDescriptor> = [];
    let arrayBuffer = ArrayBufferUtils.byteArray2ArrayBuffer([11]);
    let descriptor: ble.BLEDescriptor = {
      serviceUuid: BleConstants.UUID_SERVICE_HEART_RATE,
      characteristicUuid: BleConstants.UUID_CHARACTERISTIC_HEART_RATE_MEASUREMENT,
      descriptorUuid: BleConstants.UUID_DESCRIPTOR_HEART_RATE,
      descriptorValue: arrayBuffer
    };
    descriptors[0] = descriptor;

    let characteristics: Array<ble.BLECharacteristic> = [];
    let arrayBufferC = ArrayBufferUtils.byteArray2ArrayBuffer([1]);
    let characteristic: ble.BLECharacteristic = {
      serviceUuid: BleConstants.UUID_SERVICE_HEART_RATE,
      characteristicUuid: BleConstants.UUID_CHARACTERISTIC_HEART_RATE_MEASUREMENT,
      characteristicValue: arrayBufferC,
      descriptors: descriptors
    };
    characteristics[0] = characteristic;

    let service: ble.GattService = {
      serviceUuid: BleConstants.UUID_SERVICE_HEART_RATE,
      isPrimary: true,
      characteristics: characteristics,
      includeServices: []
    };

    try {
      this.mGattServer.addService(service);
      Log.info(TAG, `startAdvertiser: addService suc`);
    } catch (err) {
      Log.error(TAG, `startAdvertiser: addService err = ${err}`);
    }

    try {
      this.onConnectStateChange();
      ble.startAdvertising({
        interval: 160,
        txPower: 1,
        connectable: true,
      }, {
        serviceUuids: [BleConstants.UUID_SERVICE_HEART_RATE],
        manufactureData: [],
        serviceData: [],
      }, {
        serviceUuids: [BleConstants.UUID_SERVICE_HEART_RATE],
        manufactureData: [],
        serviceData: [],
      });
      Log.info(TAG, `startAdvertiser: startAdvertising suc`);
      return true;
    } catch (err) {
      Log.error(TAG, `startAdvertiser: startAdvertising err = ${err}`);
    }
    return false;
  }

  stopAdvertiser() {
    Log.info(TAG, `stopAdvertiser`);
    if (this.mGattServer) {
      try {
        this.offConnectStateChange();
        ble.stopAdvertising();
      } catch (err) {
        Log.error(TAG, `stopAdvertiser: startAdvertising err = ${err}`);
      }
    } else {
      Log.warn(TAG, `stopAdvertiser: mGattServer is null`);
    }
  }

  notifyCharacteristicChanged(deviceId: string, heartRate: number) {
    Log.info(TAG, `notifyCharacteristicChanged: deviceId = ${deviceId}, heartRate = ${heartRate}`);

    if (!deviceId) {
      Log.warn(TAG, `deviceId is null`);
      return;
    }

    if (this.mGattServer) {
      try {
        let descriptors: ble.BLEDescriptor[] = [];
        let arrayBuffer = ArrayBufferUtils.byteArray2ArrayBuffer([11]);
        let descriptor: ble.BLEDescriptor = {
          serviceUuid: BleConstants.UUID_SERVICE_HEART_RATE,
          characteristicUuid: BleConstants.UUID_CHARACTERISTIC_HEART_RATE_MEASUREMENT,
          descriptorUuid: BleConstants.UUID_DESCRIPTOR_HEART_RATE,
          descriptorValue: arrayBuffer
        };
        descriptors[0] = descriptor;
        let arrayBufferC = ArrayBufferUtils.byteArray2ArrayBuffer([0x00, heartRate]);
        let characteristic: ble.BLECharacteristic = {
          serviceUuid: BleConstants.UUID_SERVICE_HEART_RATE,
          characteristicUuid: BleConstants.UUID_CHARACTERISTIC_HEART_RATE_MEASUREMENT,
          characteristicValue: arrayBufferC,
          descriptors: descriptors
        };
        let notifyCharacteristic: ble.NotifyCharacteristic = {
          serviceUuid: BleConstants.UUID_SERVICE_HEART_RATE,
          characteristicUuid: BleConstants.UUID_CHARACTERISTIC_HEART_RATE_MEASUREMENT,
          characteristicValue: characteristic.characteristicValue,
          confirm: false
        };
        this.mGattServer.notifyCharacteristicChanged(deviceId, notifyCharacteristic);
      } catch (err) {
        Log.error(TAG, `notifyCharacteristicChanged: notifyCharacteristicChanged err = ${err}`);
      }
    } else {
      Log.warn(TAG, `notifyCharacteristicChanged: mGattServer is null`);
    }
  }

  private onBTStateChange() {
    Log.info(TAG, `onBTStateChange`);
    try {
      access.on('stateChange', (data: access.BluetoothState) => {
        Log.info(TAG, `onBTStateChange: data = ${data}`);
        if (data === access.BluetoothState.STATE_ON) {
          AppStorage.SetOrCreate('bluetoothEnable', true);
          this.startAdvertiser();
        }
        if (data === access.BluetoothState.STATE_OFF) {
          AppStorage.SetOrCreate('bluetoothEnable', false);
        }
      });
    } catch (err) {
      Log.error(TAG, `onBTStateChange: err = ${err}`);
    }
  }

  private offBTStateChange() {
    Log.info(TAG, `offBTStateChange`);
    try {
      access.off('stateChange');
    } catch (err) {
      Log.error(TAG, `offBTStateChange: err = ${err}`);
    }
  }

  private onConnectStateChange() {
    Log.info(TAG, `onConnectStateChange`);
    if (!this.mGattServer) {
      Log.info(TAG, `onConnectStateChange: mGattServer is null`);
      return;
    }

    try {
      this.mGattServer.on('connectionStateChange', async (data: ble.BLEConnectionChangeState) => {
        Log.info(TAG, `onConnectStateChange: data = ${JSON.stringify(data)}`);
        if (data) {
          if (data.state === constant.ProfileConnectionState.STATE_CONNECTED) {
            Log.info(TAG, `onConnectStateChange: Connected GATT Device.`);
            let deviceId = data.deviceId;
            AppStorage.SetOrCreate('deviceId', deviceId);
            Log.info(TAG, `onConnectStateChange: Connected GATT Device. deviceId = ${deviceId}`);
          } else if (data.state === constant.ProfileConnectionState.STATE_DISCONNECTED) {
            Log.info(TAG, `onConnectStateChange: Disonnected GATT Device.`);
            AppStorage.SetOrCreate('deviceId', '');
          }
        }
      });
    } catch (err) {
      Log.error(TAG, `onConnectStateChange: err = ${err}`);
    }
  }

  private offConnectStateChange() {
    Log.info(TAG, `offConnectStateChange`);
    if (!this.mGattServer) {
      Log.info(TAG, `offConnectStateChange: mGattServer is null`);
      return;
    }

    try {
      this.mGattServer.off('connectionStateChange');
    } catch (err) {
      Log.error(TAG, `offConnectStateChange: err = ${err}`);
    }
  }
}

let advertiserBluetoothViewModel = new AdvertiserBluetoothViewModel();

export default advertiserBluetoothViewModel as AdvertiserBluetoothViewModel;