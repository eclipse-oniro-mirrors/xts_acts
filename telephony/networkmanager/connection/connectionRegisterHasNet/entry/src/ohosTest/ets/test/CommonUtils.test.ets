/**
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import connection from '@ohos.net.connection';
import { describe, expect, it , TestType, Size, Level, beforeEach } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

let isNetLost = false;
let isNetAvailable = false;
let isNetUnavailable = false;
let isNetConnectionPropertiesChange = false;
let isNetCapabilitiesChange = false;
let netCapInfo: connection.NetCapabilityInfo | undefined = undefined;
let netPropertyInfo: connection.NetConnectionPropertyInfo | undefined = undefined;
let availableNet: connection.NetHandle | undefined = undefined;
let lostNet: connection.NetHandle | undefined = undefined;
let ListenTimes : number = 0;
const NetBearTypeBEARER_CELLULAR = connection.NetBearType.BEARER_CELLULAR;
const NetBearTypeBEARER_WIFI = connection.NetBearType.BEARER_WIFI;
const NetBearTypeBEARER_BLUETOOTH = connection.NetBearType.BEARER_BLUETOOTH;
const NetBearTypeBEARER_ETHERNET = connection.NetBearType.BEARER_ETHERNET;
const NetBearTypeBEARER_VPN = connection.NetBearType.BEARER_VPN;
const NetCapNET_CAPABILITY_MMS = connection.NetCap.NET_CAPABILITY_MMS;
const NetCapNET_CAPABILITY_NOT_METERED = connection.NetCap.NET_CAPABILITY_NOT_METERED;
const NetCapNET_CAPABILITY_INTERNET = connection.NetCap.NET_CAPABILITY_INTERNET;
const NetCapNET_CAPABILITY_NOT_VPN = connection.NetCap.NET_CAPABILITY_NOT_VPN;
const NetCapNET_NET_CAPABILITY_VALIDATED = connection.NetCap.NET_CAPABILITY_VALIDATED;
const NetCapNET_CAPABILITY_PORTAL = connection.NetCap.NET_CAPABILITY_PORTAL;
const NetCapNET_CAPABILITY_CHECKING_CONNECTIVITY = connection.NetCap.NET_CAPABILITY_CHECKING_CONNECTIVITY;

export class CommonUtils {
  public isValidV4NetAddress(caseName: string, addr: connection.NetAddress): boolean {
    console.info(caseName + "isValidV4NetAddress:" + JSON.stringify(addr))
    let res: boolean = this.isValidIPv4Regex(caseName, addr.address);
    if (addr.family) {
      let family: number = addr.family;
      res = res && family === 1
    }
    if (addr.port) {
      let port: number = addr.port;
      res = res && port >= 0 && port <= 65535
    }
    return res;
  }

  public isValidIPv6Address(caseName: string, addr: connection.NetAddress, isRoute: boolean = false): boolean {
    console.info(caseName + "isValidIPv6Address：" + JSON.stringify(addr))
    let res: boolean = this.validateIPv6GlobalAddress(caseName, addr.address, isRoute);
    if (addr.family) {
      let family: number = addr.family;
      res = res && addr.family === 2;
    }
    if (addr.port) {
      let port: number = addr.port;
      res = res && port >= 0 && port <= 65535;
    }
    return res;
  }

  public sleep (time:number):Promise<string>{
    return new Promise<string>((resolve)=>{
      setTimeout(()=>{
        resolve('ok')},time)
    });
  }

  private isValidIPv4Regex(caseName: string, ip: string): boolean {
    // IPv4正则表达式：
    // ^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$
    // 但需要检查每段数字是否在0-255之间

    const ipv4Pattern: RegExp =
      /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;
    return ipv4Pattern.test(ip);
  }

  /**
   * 基本IPv6地址格式验证
   */
  private isValidIPv6(ip: string): boolean {
    // 简单的IPv6格式正则（匹配压缩和未压缩格式）
    const ipv6Pattern =
      /^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|(([0-9a-fA-F]{1,4}:){0,6}[0-9a-fA-F]{1,4})?::(([0-9a-fA-F]{1,4}:){0,6}[0-9a-fA-F]{1,4})?)$/;

    // 检查IPv4映射的IPv6地址
    const ipv4MappedPattern = /^::ffff:(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})$/;

    if (ip.includes('.')) {
      // 包含点号，可能是IPv4映射地址
      if (ipv4MappedPattern.test(ip)) {
        return true;
      }
      return false;
    }
    return ipv6Pattern.test(ip);
  }

  /**
   * 将IPv6地址展开为完整形式（8组4位十六进制）
   */
  private expandIPv6(ip: string): string | null {
    // 处理IPv4映射地址
    if (ip.includes('.')) {
      const match = ip.match(/^::ffff:(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})$/);
      if (!match) {
        return null;
      }
      // 转换为标准的IPv4映射IPv6格式
      const ipv4Parts = match[1].split('.').map(Number);
      const ipv4Hex = ipv4Parts.map(part => {
        if (part < 0 || part > 255) return null;
        return part.toString(16).padStart(2, '0');
      }).join('');

      if (ipv4Hex.includes('null')) {
        return null;
      }

      return `0000:0000:0000:0000:0000:ffff:${ipv4Hex.substring(0, 4)}:${ipv4Hex.substring(4)}`;
    }

    // 处理双冒号压缩
    if (ip.includes('::')) {
      const parts = ip.split('::');
      const left = parts[0] ? parts[0].split(':') : [];
      const right = parts[1] ? parts[1].split(':') : [];

      const missingGroups = 8 - (left.length + right.length);
      if (missingGroups < 1) {
        return null;
      }

      const middle: string[] = Array(missingGroups).fill('0000');
      const allParts: string[] = [...left, ...middle, ...right];

      // 确保总共有8组
      if (allParts.length !== 8) {
        return null;
      }

      // 填充每组为4位十六进制
      return allParts.map(part => {
        if (!part) return '0000';
        return part.padStart(4, '0');
      }).join(':');
    }

    // 已经是未压缩格式
    const parts = ip.split(':');
    if (parts.length !== 8) {
      return null;
    }

    return parts.map(part => part.padStart(4, '0')).join(':');
  }

  /**
   * 更严格的校验函数（包含更多IPv6特性检查）
   */
  private validateIPv6GlobalAddress(caseName: string, ip: string, isRoute: boolean): boolean {
    // 1. 空值检查
    if (!ip || typeof ip !== 'string') {
      console.error(caseName + "地址为空或非字符串")
      return false;
    }

    // 2. 去除两端空格
    const trimmedIp = ip.trim();

    // 3. 基本IPv6格式验证
    if (!this.isValidIPv6(trimmedIp)) {
      console.error(caseName + "无效的IPV6格式")
      return false;
    }

    // 4. 检查本地/特殊地址
    const expanded = this.expandIPv6(trimmedIp);
    if (!expanded) {
      console.error(caseName + "无法展开IPv6地址")
      return false;
    }

    const firstHex = expanded.substring(0, 4);
    const firstHexNum = parseInt(firstHex, 16);

    // 排除特殊地址范围
    // ::/128 未指定地址
    if (!isRoute) {
      if (expanded === '0000:0000:0000:0000:0000:0000:0000:0000') {
        console.error(caseName + "未指定地址(::/128)")
        return false;
      }

      // ::1/128 环回地址
      if (expanded === '0000:0000:0000:0000:0000:0000:0000:0001') {
        console.error(caseName + "环回地址(::1/128)")
        return false;
      }

      // fe80::/10 链路本地地址
      if (firstHexNum >= 0xfe80 && firstHexNum <= 0xfebf) {
        console.error(caseName + "链路本地地址(fe80::/10)")
        return false;
      }

      // fc00::/7 唯一本地地址
      if (firstHexNum >= 0xfc00 && firstHexNum <= 0xfdff) {
        console.error(caseName + "唯一本地地址(fc00::/7)")
        return false;
      }

      // ff00::/8 组播地址
      if (firstHexNum >= 0xff00 && firstHexNum <= 0xffff) {
        console.error(caseName + "组播地址(ff00::/8)")
        return false;
      }

      // 2000::/3 全局单播地址
      const firstThreeBits = firstHexNum >>> 13;
      if (firstThreeBits !== 0x1) {
        console.error(caseName + "非全局单播地址")
        return false;
      }
    }
    return true;
  }
}

