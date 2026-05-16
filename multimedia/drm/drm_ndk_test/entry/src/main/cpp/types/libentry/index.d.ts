/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
export const GetOfflineMediaKeyIds: () => string;
export const GetCertificateStatus: () => number;
export const Test_KeySystemSupported: (uuid: string) => number;
export const Test_KeySystemSupported2: (uuid: string,mineType:string) => number;
export const Test_KeySystemSupported3: (uuid: string,mineType:string,level:number) => number;
export const Test_MediaKeySystem_Create: (name: string,system:string) => number;
export const Test_MediaKeySystem_SetConfigurationString: (system:string,configName: string,valueIn:string) => number;
export const Test_MediaKeySystem_GetConfigurationString: (system:string,configName: string,valueOut:string, valueOutLen:number) => number;
export const Test_MediaKeySystem_SetConfigurationByteArray: (system:string,configName: string,value:string,valueLen:number) => number;
export const Test_MediaKeySystem_GetConfigurationByteArray: (system:string,configName: string,value:string,valueLen:string) => number;
export const Test_MediaKeySystem_GetStatistics: (system:string,statistics: string) => number;
export const Test_MediaKeySystem_GetMaxContentProtectionLevel: (system:string,levelPtr: string) => number;
export const GetMaxContentProtectionLevel: (system:string,levelPtr: string) => number;
export const Test_CreateMediaKeySession: (system:string,level:number,session:string) => number;
export const Test_MediaKeySystem_GenerateKeySystemRequest: (system:string,request:string,requestLen:string,defaultUrl:string,defaultUrlLen:number) => number;
export const Test_MediaKeySystem_ProcessKeySystemResponse: (system:string,responseData: string,responseLen:number) => number;
export const Test_MediaKeySystem_GetOfflineMediaKeyIds: (system:string,KeyIds: string) => number;
export const Test_MediaKeySystem_GetOfflineMediaKeyStatus: (system:string, KeyIdsIn:string, KeyIdsLen:number, statusPtr:string, expectStatus:number) => number;
export const Test_MediaKeySystem_ClearOfflineMediaKeys: (system:string,KeyIds: string,keyIdLen:number) => number;
export const Test_MediaKeySystem_GetCertificateStatus: (system:string,certStatus: string) => number;
export const Test_MediaKeySystem_Destroy: (system:string, num:number) => number;
export const Test_MediaKeySystem_SetMediaKeySystemCallback: (system:string) => number;
export const Test_MediaKeySession_GenerateMediaKeyRequest: (session:string,info:string,request:string) => number;
export const Test_MediaKeySession_ProcessMediaKeyResponse: (session:string,response: string,responseLen:number,KeyIdOut:string,KeyIdOutLenSting:string) => number;
export const Test_MediaKeySession_CheckMediaKeyStatus: (session:string,status:string, licenseNum:number) => number;
export const Test_MediaKeySession_ClearMediaKeys: (session:string) => number;
export const Test_MediaKeySession_GenerateOfflineReleaseRequest: (session:string,keyIdIn:string,keyIdLen:number,outRequest: string,outRequestLen: string) => number;
export const Test_MediaKeySession_ProcessOfflineReleaseResponse: (session:string,keyIdIn:string,keyIdLen:number,response:string,responseLen:number) => number;
export const Test_MediaKeySession_RestoreOfflineMediaKeys: (session:string,keyIdIn:string,keyIdLen:number) => number;
export const Test_MediaKeySession_GetContentProtectionLevel: (session:string,levelPtr: string,) => number;
export const Test_MediaKeySession_RequireSecureDecoderModule: (session:string,mineType:string,statusPtr:string,expectStatus:Boolean) => number;
export const Test_MediaKeySession_SetMediaKeySessionCallback: (session:string,callback:string) => number;
export const Test_CreateMediaKeySession_multi: (sessionNum:Number) => number;
export const Test_MediaKeySession_ProcessOfflineReleaseResponse_multi: (releaseNum:Number) => number;
export const Test_MediaKeySystem_SetConfigurationString_multi: () => number;
export const Test_MediaKeySystem_SetCallback: (system:string, callback:string) => number;
export const Test_MediaKeySession_SetCallback: (session:string, callback:string) => number;
export const Test_MediaKeySystem_GetMediaKeySystems: (des:string, count:string) => number;
export const Test_MediaKeySystem_Drmerrcode: () => number;
