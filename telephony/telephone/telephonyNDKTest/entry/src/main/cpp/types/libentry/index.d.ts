/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

export interface XTSNetworkStateObj {
  longOperatorName: string;
  shortOperatorName: string;
  plmnNumeric: string;
  isRoaming: boolean;
  regState: number;
  nsaState: number;
  cfgTech: number;
  isCaActive: boolean;
  isEmergency: boolean;
}

export const OHTelephonyGetDefaultCellularDataSlotId: () => number;

export const OHTelephonyGetNetworkStateForSlotParam: (a: number) => number;

export const OHTelephonyGetNetworkStateParam: (a: number) => number;

export const OHTelephonyGetNetworkStateForSlot: (soltId: number) => XTSNetworkStateObj;

export const OHTelephonyGetNetworkState: () => XTSNetworkStateObj;

export const GetNetworkState0601: () => number;
      
export const GetNetworkState0701: () => number;

export const GetNetworkState0801: () => number;