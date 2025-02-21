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

import util from '@ohos.util';
import ble from '@ohos.bluetooth.ble';
import promptAction from '@ohos.promptAction';
import BluetoothDevice from './BluetoothDevice';
import ArrayBufferUtils from '../util/ArrayBufferUtils';
import BleConstants from './BleConstants';
import Log from '../../../model/Logger';
import access from '@ohos.bluetooth.access';
import constant from '@ohos.bluetooth.constant';
import emitter from '@ohos.events.emitter';

const TAG = '[BleManager]';

export class ConnectionState {
  static STATE_CONNECTING = 1;
  static STATE_CONNECTED = 2;
  static STATE_DISCONNECTING = 3;
  static STATE_DISCONNECTED = 4;
}

export class BluetoothViewModel {
  private mGattClientDevice: ble.GattClientDevice;
  private mConnectBluetoothDevice: BluetoothDevice = {};
  private mAvailableDevices: BluetoothDevice[] = [];
  private mTimeoutID: number = -1;

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

  startBLEScan(): boolean {
    Log.info(TAG, `startBleScan`);

    if (!this.isBluetoothEnabled()) {
      Log.info(TAG, `startBLEScan: bluetooth is disable.`);
      this.enableBluetooth();
      promptAction.showToast({
        message: '正在开启蓝牙',
        duration: 2000
      });
      return false;
    }
    let ret = this.startBLEScanInner();
    Log.info(TAG, `startBLEScan: startBLEScanInner.`);
    this.onBLEDeviceFind();
    Log.info(TAG, `startBLEScan: onBLEDeviceFind.`);
    return ret;
  }

  stopBLEScan() {
    Log.info(TAG, `stopBLEScan`);
    clearTimeout(this.mTimeoutID);
    this.offBLEDeviceFind();
    this.stopBLEScanInner();
  }

  connect(bluetoothDevice: BluetoothDevice): boolean {
    Log.info(TAG, `connect: bluetoothDevice = ${JSON.stringify(bluetoothDevice)}`);
    if (this.mGattClientDevice && this.mConnectBluetoothDevice && this.mConnectBluetoothDevice.deviceId === bluetoothDevice.deviceId) {
      Log.warn(TAG, `Trying to use an existing ${JSON.stringify(bluetoothDevice.deviceId)} for connection.`);
      let ret: boolean = this.connectInner(this.mGattClientDevice);
      return ret;
    }

    this.close();

    this.mConnectBluetoothDevice = bluetoothDevice;
    AppStorage.SetOrCreate('connectBluetoothDevice', this.mConnectBluetoothDevice);

    this.mGattClientDevice = ble.createGattClientDevice(bluetoothDevice.deviceId);
    let ret: boolean = this.connectInner(this.mGattClientDevice);
    if (ret) {
      Log.info(TAG, `Trying to create a new connection.`);
    } else {
      Log.error(TAG, `Trying to create a new connection fail.`);
      this.close();
    }
    return ret;
  }

  disconnect() {
    Log.info(TAG, `disconnect`);
    this.disconnectInner(this.mGattClientDevice);
  }

  close() {
    Log.info(TAG, `close`);
    this.closeInner(this.mGattClientDevice);
  }

  getConnectionState(): number {
    Log.info(TAG, `getConnectionState: mConnectBluetoothDevice.connectionState = ${JSON.stringify(this.mConnectBluetoothDevice.connectionState)}`);
    return this.mConnectBluetoothDevice.connectionState;
  }

  private onBTStateChange() {
    Log.info(TAG, `onBTStateChange`);
    try {
      access.on('stateChange', (data: access.BluetoothState) => {
        Log.info(TAG, `onBTStateChange: data = ${data}`);
        if (data === access.BluetoothState.STATE_ON) {
          this.startBLEScan();
        } else if (data === access.BluetoothState.STATE_OFF) {
          this.mAvailableDevices = [];
          AppStorage.SetOrCreate('availableDevices', this.mAvailableDevices);
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

  private onBLEDeviceFind() {
    try {
      ble.on('BLEDeviceFind', (arr: Array<ble.ScanResult>) => {
        Log.info(TAG, `onBLEDeviceFind: BLEDeviceFind arr.length = ${arr.length}, arr = ${JSON.stringify(arr)}`);

        let deviceId: string = arr[0].deviceId;
        let deviceName: string = arr[0].deviceName;
        let rssi: number = arr[0].rssi;
        let device = this.mAvailableDevices.find(availableDevice => {
          return availableDevice.deviceId === deviceId;
        })
        if (!device) {
          Log.info(TAG, `onBLEDeviceFind: deviceId = ${deviceId}, deviceName = ${deviceName}`);
          this.mAvailableDevices.push(this.getDevice(deviceId, deviceName,rssi));
          AppStorage.SetOrCreate('availableDevices', this.mAvailableDevices);
        }
      })
    } catch (err) {
      Log.error(TAG, `onBLEDeviceFind: err = ${err}`);
    }
  }

  private offBLEDeviceFind() {
    try {
      ble.off('BLEDeviceFind');
    } catch (err) {
      Log.error(TAG, `offBLEDeviceFind: err = ${err}`);
    }
  }

  private onBLEConnectionStateChange() {
    Log.info(TAG, `onBLEConnectionStateChange`);
    if (!this.mGattClientDevice) {
      Log.info(TAG, `onBLEConnectionStateChange: mGattClientDevice is null`);
      return;
    }

    try {
      this.mGattClientDevice.on('BLEConnectionStateChange', async (data: ble.BLEConnectionChangeState) => {
        Log.info(TAG, `onBLEConnectionStateChange: data = ${JSON.stringify(data)}`);
        let deviceId: string = data.deviceId;
        let state: ble.ProfileConnectionState = data.state;
        if (data) {
          if (state === constant.ProfileConnectionState.STATE_CONNECTED) {
            Log.info(TAG, `onBLEConnectionStateChange: Connected GATT server.`);
            this.mConnectBluetoothDevice.connectionState = ConnectionState.STATE_CONNECTED;
            AppStorage.SetOrCreate('connectBluetoothDevice', this.mConnectBluetoothDevice);

            try {
              // Starts discovering services.
              let services: Array<ble.GattService> = await this.mGattClientDevice.getServices();
              Log.info(TAG, `onBLEConnectionStateChange: services = ${JSON.stringify(services)}`);

              // Characteristic enable/disable indicate/notify
              let service: ble.GattService = services.find(item => item.serviceUuid === BleConstants.UUID_SERVICE_HEART_RATE);
              let characteristics: Array<ble.BLECharacteristic> = service.characteristics;
              let characteristic: ble.BLECharacteristic = characteristics.find(item => item.characteristicUuid === BleConstants.UUID_CHARACTERISTIC_HEART_RATE_MEASUREMENT);
              Log.info(TAG, `onBLEConnectionStateChange: characteristic = ${JSON.stringify(characteristic)}`);
              this.mGattClientDevice.setCharacteristicChangeNotification(characteristic, true);
              let descriptors: Array<ble.BLEDescriptor> = characteristic.descriptors;
              let descriptor: ble.BLEDescriptor = descriptors.find(item => item.descriptorUuid === BleConstants.UUID_DESCRIPTOR_HEART_RATE);
              Log.info(TAG, `onBLEConnectionStateChange: descriptor = ${JSON.stringify(descriptor)}`);
              descriptor.descriptorValue = ArrayBufferUtils.byteArray2ArrayBuffer([0x01, 0x00]);
              this.mGattClientDevice.writeDescriptorValue(descriptor);
            } catch (err) {
              Log.error(TAG, `onBLEConnectionStateChange: err = ${err}`);
            }

          } else if (state === constant.ProfileConnectionState.STATE_DISCONNECTED) {
            Log.info(TAG, `onBLEConnectionStateChange: Disonnected GATT server.`);
            if (this.getConnectionState() === ConnectionState.STATE_CONNECTING) {
              Log.warn(TAG, `onBLEConnectionStateChange: Connect GATT server fail.`);
              this.close();
            } else if (this.getConnectionState() === ConnectionState.STATE_CONNECTED || this.getConnectionState() === ConnectionState.STATE_DISCONNECTING) {
              Log.warn(TAG, `onBLEConnectionStateChange: Disconnected from GATT server.`);
              this.close();
            }
          }
        }
      })
    } catch (err) {
      Log.error(TAG, `onBLEConnectionStateChange: err = ${err}`);
    }
  }

  private offBLEConnectionStateChange() {
    Log.info(TAG, `offBLEConnectionStateChange`);
    if (!this.mGattClientDevice) {
      Log.info(TAG, `offBLEConnectionStateChange: mGattClientDevice is null`);
      return;
    }

    try {
      this.mGattClientDevice.off('BLEConnectionStateChange');
    } catch (err) {
      Log.error(TAG, `offBLEConnectionStateChange: err = ${err}`);
    }
  }

  private onBLECharacteristicChange() {
    Log.info(TAG, `onBLECharacteristicChange`);
    if (!this.mGattClientDevice) {
      Log.info(TAG, `onBLECharacteristicChange: mGattClientDevice is null`);
      return;
    }

    this.mGattClientDevice.on('BLECharacteristicChange', (data: ble.BLECharacteristic) => {
      Log.info(TAG, `onBLECharacteristicChange: data = ${JSON.stringify(data)}`);
      let characteristicValue: ArrayBuffer = data.characteristicValue;
      Log.info(TAG, `onBLECharacteristicChange: characteristicValue.length = ${characteristicValue.byteLength}, characteristicValue = ${JSON.stringify(new Uint8Array(characteristicValue))}`);
      let byteArr = ArrayBufferUtils.arrayBuffer2ByteArray(characteristicValue);
      Log.info(TAG, `byteArr = ${byteArr}`);
      let heartRate = byteArr[1];
      let eventData12: emitter.EventData = {
        data: {
          "content": heartRate,
          "id": 12
        }
      };

      let innerEvent12: emitter.InnerEvent = {
        eventId: 12,
        priority: emitter.EventPriority.HIGH
      };

      emitter.emit(innerEvent12, eventData12);
    })
  }

  private offBLECharacteristicChange() {
    Log.info(TAG, `offBLECharacteristicChange`);
    if (!this.mGattClientDevice) {
      Log.info(TAG, `offBLECharacteristicChange: mGattClientDevice is null`);
      return;
    }

    this.mGattClientDevice.off('BLECharacteristicChange');
  }

  private startBLEScanInner(): boolean {
    try {
      this.mAvailableDevices = [];
      if (this.mConnectBluetoothDevice.connectionState === ConnectionState.STATE_CONNECTED) {
        this.mAvailableDevices.push(this.mConnectBluetoothDevice);
      }
      AppStorage.SetOrCreate('availableDevices', this.mAvailableDevices);
      ble.startBLEScan(null);
      Log.info(TAG, `startBLEScanInner: scan ble start`);
      this.mTimeoutID = setTimeout(() => {
        Log.info(TAG, `startBLEScanInner: scan ble finished`);
        this.stopBLEScan();
      }, 300000);
      return true;
    } catch (err) {
      Log.error(TAG, `startBLEScanInner: err = ${err}`);
    }
    return false;
  }

  private stopBLEScanInner() {
    Log.info(TAG, `stopBLEScanInner`);
    try {
      ble.stopBLEScan();
      Log.info(TAG, `stopBLEScanInner: scan ble stop`);
    } catch (err) {
      Log.error(TAG, `stopBLEScanInner: err = ${err}`);
    }
  }

  private connectInner(gattClientDevice: ble.GattClientDevice): boolean {
    Log.info(TAG, `connectInner`);
    try {
      if (!gattClientDevice) {
        Log.warn(TAG, `connectInner: mGattClientDevice is null`);
        return false;
      }

      this.onBLEConnectionStateChange();
      this.onBLECharacteristicChange();
      gattClientDevice.connect();
      this.mConnectBluetoothDevice.connectionState = ConnectionState.STATE_CONNECTING;
      AppStorage.SetOrCreate('connectBluetoothDevice', this.mConnectBluetoothDevice);
      return true;
    } catch (err) {
      Log.error(TAG, `connectInner: err = ${err}`);
    }
    return false;
  }

  private disconnectInner(gattClientDevice: ble.GattClientDevice) {
    Log.info(TAG, `disconnectInner`);
    try {
      if (!gattClientDevice) {
        Log.warn(TAG, `disconnectInner: mGattClientDevice is null`);
        return;
      }
      this.offBLEConnectionStateChange();
      this.offBLECharacteristicChange();
      if (this.getConnectionState() === ConnectionState.STATE_CONNECTING) {
        Log.warn(TAG, `disconnectInner: mConnectionState is ConnectionState.STATE_CONNECTING`);
        this.close();
      } else if (this.getConnectionState() === ConnectionState.STATE_CONNECTED) {
        Log.warn(TAG, `disconnectInner: mConnectionState is ConnectionState.STATE_CONNECTED`);
        gattClientDevice.disconnect();
        this.mConnectBluetoothDevice.connectionState = ConnectionState.STATE_DISCONNECTING;
        AppStorage.SetOrCreate('connectBluetoothDevice', this.mConnectBluetoothDevice);
        this.close(); // @ohos.bluetooth不会调用BLEConnectionStateChange通知disconnected成功，但是@ohos.bluetoothManager没问题
      }
    } catch (err) {
      Log.error(TAG, `disconnectInner: err = ${err}`);
    }
  }

  private closeInner(gattClientDevice: ble.GattClientDevice) {
    Log.info(TAG, `closeInner`);
    try {
      if (!gattClientDevice) {
        Log.warn(TAG, `closeInner: mGattClientDevice is null`);
        return;
      }

      gattClientDevice.close();
      Log.warn(TAG, `closeInner: gatt close`);
      this.mConnectBluetoothDevice.connectionState = ConnectionState.STATE_DISCONNECTED;
      AppStorage.SetOrCreate('connectBluetoothDevice', this.mConnectBluetoothDevice);
      this.release();
    } catch (err) {
      Log.error(TAG, `closeInner: err = ${err}`);
    }
  }

  private release() {
    Log.warn(TAG, `release`);
    this.mGattClientDevice = null;
    this.mTimeoutID = -1;
  }

  private getDevice(deviceId: string, deviceName: string, rssi: number): BluetoothDevice {
    Log.info(TAG, `getDevice: deviceId = ${deviceId}, deviceName = ${deviceName}, rssi = ${rssi}`);
    let device = new BluetoothDevice();
    device.deviceId = deviceId;
    if(deviceName){
      device.deviceName = deviceName;
    }else {
      device.deviceName = 'N/A'
    }
    device.rssi = rssi
    Log.info(TAG, `getDevice: device = ${JSON.stringify(device)}`);
    return device;
  }
}

let bluetoothViewModel = new BluetoothViewModel();

export default bluetoothViewModel as BluetoothViewModel;