/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export const NetConn_HasDefaultNet: () => number;
export const NetConn_GetDefaultNet: () => number;
export const NetConn_IsDefaultNetMetered: () => number;
export const NetConn_GetConnectionProperties: () => number;
export const NetConn_GetNetCapabilities: () => number;
export const NetConn_GetAddrInfo: (a : string, b: string) => number;
export const NetConn_GetAllNets: () => number;
export const NetConn_SetPacUrl: (a : string) => number;
export const NetConn_GetPacUrl: (a : number) => number;
export const NetConn_NetCapabilities_netCaps: (a : number) => number;
export const NetConnUnregisterNetConnCallback: (a : number) => number;
export const WebSocket_Close_Result: (a: number) => number;
export const WebSocket_Error_Result: (a: number) => number;
export const WebSocket_Open_Result:(a: number) => number;
export const WebSocket_Request_Options: () => number;
export const Web_Socket: (a: number) => number;
export const Web_Socket_ErrCode: (a: number, b: string) => number;
export const NetStack_Certificate_PinningKind: (a: string) => number;
export const NetStack_Hash_Algorithm: (a: string) => number;
export const Public_KeyHash: (a: string) => number;
export const NetStack_IsCleartextPermitted: (a: number) => number;
export const NetStack_IsCleartextPermittedByHostName: (a: number, b: string) => number;
export const NetConn_Net_Specifier: (a: number) => number;
export const NetConn_Net_Addr: (a: number, b: string) => number;
export const NetConn_RouteConn: (a: number, b: string) => number;
export const NetConn_Http_Proxy: (a: number, b: string) => number;
export const NetConn_Connection_Properties: (a: number, b: string) => number;
export const NetConn_NetHandle_List: (a: number) => number;
export const Register_DnsResolver: (a: number) => number;
export const Unregister_DnsResolver: (a: number) => number;
export const Register_DetCallback: (a: number) => number;
export const NetCon_QueryProResult: (a: number, b: string) => number;
export const NetConn_QueryTrRout: (a: number, b: string) => number;
export const NetConn_FreeDnsResult: (a : number) => number;
export const NetConn_BindSocket: (a : number) => number;
export const CertVerification: (a : string, b: string) => number;
export const GetCertificatesHost: (a : string) => number;
