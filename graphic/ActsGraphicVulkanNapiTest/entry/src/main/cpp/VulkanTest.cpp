/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, Hardware
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "VulkanTest.h"
#include <cstddef>
#include <iostream>
#include <native_window/external_window.h>
#include <sstream>
#include <string>
#include <vector>
#include "vulkan/vulkan.h"
#include "vulkan/vulkan_ohos.h"
namespace vulkan {
namespace loader {

static PFN_vkCreateDebugUtilsMessengerEXT vkCreateDebugUtilsMessengerEXT = nullptr;
static PFN_vkDestroyDebugUtilsMessengerEXT vkDestroyDebugUtilsMessengerEXT = nullptr;
static PFN_vkDestroyInstance vkDestroyInstance = nullptr;
static PFN_vkDestroySurfaceKHR vkDestroySurfaceKHR = nullptr;
static PFN_vkCreateDevice vkCreateDevice = nullptr;
static PFN_vkDestroyDevice vkDestroyDevice = nullptr;
static PFN_vkEnumeratePhysicalDevices vkEnumeratePhysicalDevices = nullptr;
static PFN_vkCreateSurfaceOHOS vkCreateSurfaceOHOS = nullptr;
static PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR fpGetPhysicalDeviceSurfaceCapabilitiesKHR = nullptr;
static PFN_vkGetPhysicalDeviceSurfacePresentModesKHR fpGetPhysicalDeviceSurfacePresentModesKHR = nullptr;
static PFN_vkGetPhysicalDeviceSurfaceFormatsKHR fpGetPhysicalDeviceSurfaceFormatsKHR = nullptr;
static PFN_vkCreateSwapchainKHR fpCreateSwapchainKHR = nullptr;
static PFN_vkDestroySwapchainKHR fpDestroySwapchainKHR = nullptr;
static PFN_vkAcquireNextImage2KHR fpAcquireNextImage2KHR = nullptr;
static PFN_vkQueuePresentKHR fpQueuePresentKHR = nullptr;
static PFN_vkGetPhysicalDeviceQueueFamilyProperties vkGetPhysicalDeviceQueueFamilyProperties = nullptr;
static PFN_vkGetPhysicalDeviceProperties vkGetPhysicalDeviceProperties = nullptr;
static PFN_vkGetPhysicalDeviceFeatures vkGetPhysicalDeviceFeatures = nullptr;
static PFN_vkGetPhysicalDeviceMemoryProperties vkGetPhysicalDeviceMemoryProperties = nullptr;
static PFN_vkGetPhysicalDeviceSurfaceSupportKHR vkGetPhysicalDeviceSurfaceSupportKHR = nullptr;
static PFN_vkGetSwapchainImagesKHR fpGetSwapchainImagesKHR = nullptr;
static PFN_vkGetNativeBufferPropertiesOHOS fpGetNativeBufferPropertiesOHOS = nullptr;
static PFN_vkGetMemoryNativeBufferOHOS fpGetMemoryNativeBufferOHOS = nullptr;

static VkInstance instance = nullptr;
static VkSurfaceKHR surface = VK_NULL_HANDLE;
static VkPhysicalDevice physicalDevice = nullptr;
static VkDevice device = nullptr;
static VkSurfaceCapabilitiesKHR surfCaps = {};
static VkSurfaceFormatKHR surfaceFormat = {};
static VkSwapchainKHR swapChain = VK_NULL_HANDLE;
static VkSwapchainKHR swapChain2 = VK_NULL_HANDLE;
static VkSemaphore semaphore = VK_NULL_HANDLE;
static bool g_isSupportedVulkan = false;
static std::vector<VkQueueFamilyProperties> queueProps;
static uint32_t g_queueCount = 0;
static VkDebugUtilsMessengerEXT debugUtilsMessenger = VK_NULL_HANDLE;
static std::stringstream debugMessage;

static void TrytoCreateVkInstance()
{
    VkApplicationInfo appInfo = {};
    appInfo.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    appInfo.pApplicationName = "pApplicationName";
    appInfo.pEngineName = "pEngineName";
    appInfo.apiVersion = VK_API_VERSION_1_0;

    std::vector<const char*> instanceExtensions = { VK_KHR_SURFACE_EXTENSION_NAME,
                                                    VK_OHOS_SURFACE_EXTENSION_NAME,
                                                    VK_EXT_DEBUG_UTILS_EXTENSION_NAME };

    VkInstanceCreateInfo instanceCreateInfo = {};
    instanceCreateInfo.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    instanceCreateInfo.pNext = nullptr;
    instanceCreateInfo.pApplicationInfo = &appInfo;
    instanceCreateInfo.enabledExtensionCount = static_cast<uint32_t>(instanceExtensions.size());
    instanceCreateInfo.ppEnabledExtensionNames = instanceExtensions.data();

    VkResult result = vkCreateInstance(&instanceCreateInfo, nullptr, &instance);
    std::cout << "instance ptr: " << instance << std::endl;
    if (result != VK_SUCCESS || instance == nullptr) {
        g_isSupportedVulkan = false;
    } else {
        g_isSupportedVulkan = true;
    }
    std::cout << "set g_isSupportedVulkan: " << g_isSupportedVulkan << std::endl;
    std::cout << "TrytoCreateVkInstance result: " << result << std::endl;
}

static VkSwapchainCreateInfoKHR GetSwapchainCreateInfo(VkFormat imageFormat, VkColorSpaceKHR imageColorSpace)
{
    VkSwapchainCreateInfoKHR swapchainCI = {};
    swapchainCI.sType = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
    swapchainCI.surface = surface;
    uint32_t desiredNumberOfSwapchainImages = surfCaps.minImageCount + 1;
    if ((surfCaps.maxImageCount > 0) && (desiredNumberOfSwapchainImages > surfCaps.maxImageCount)) {
        desiredNumberOfSwapchainImages = surfCaps.maxImageCount;
    }
    swapchainCI.minImageCount = desiredNumberOfSwapchainImages;
    swapchainCI.imageFormat = imageFormat;
    swapchainCI.imageColorSpace = imageColorSpace;
    uint32_t width = 1280;
    uint32_t height = 720;
    swapchainCI.imageExtent = { width, height };
    swapchainCI.imageUsage = VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
    swapchainCI.preTransform = static_cast<VkSurfaceTransformFlagBitsKHR>(VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR);
    swapchainCI.imageArrayLayers = 1;
    swapchainCI.imageSharingMode = VK_SHARING_MODE_EXCLUSIVE;
    swapchainCI.queueFamilyIndexCount = 0;
    swapchainCI.presentMode = VK_PRESENT_MODE_IMMEDIATE_KHR;
    swapchainCI.oldSwapchain = swapChain;
    swapchainCI.clipped = VK_TRUE;
    swapchainCI.compositeAlpha = VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
    return swapchainCI;
}

static uint32_t GetQueueFamilyIndex(VkQueueFlagBits queueFlags)
{
    if (physicalDevice == nullptr || vkGetPhysicalDeviceQueueFamilyProperties == nullptr) {
        std::cout << "physicalDevice or vkGetPhysicalDeviceQueueFamilyProperties is null" << std::endl;
        return static_cast<uint32_t>(-1);
    }

    vkGetPhysicalDeviceQueueFamilyProperties(physicalDevice, &g_queueCount, nullptr);
    if (g_queueCount == 0) {
        return static_cast<uint32_t>(-1);
    }

    queueProps.resize(g_queueCount);
    vkGetPhysicalDeviceQueueFamilyProperties(physicalDevice, &g_queueCount, queueProps.data());

    for (size_t i = 0; i < queueProps.size(); i++) {
        if (queueFlags & VK_QUEUE_COMPUTE_BIT) {
            if ((queueProps[i].queueFlags & queueFlags) && ((queueProps[i].queueFlags & VK_QUEUE_GRAPHICS_BIT) == 0)) {
                return static_cast<uint32_t>(i);
            }
        }
    }

    for (size_t i = 0; i < queueProps.size(); i++) {
        if (queueFlags & VK_QUEUE_TRANSFER_BIT) {
            if ((queueProps[i].queueFlags & queueFlags) && ((queueProps[i].queueFlags & VK_QUEUE_GRAPHICS_BIT) == 0) &&
                ((queueProps[i].queueFlags & VK_QUEUE_COMPUTE_BIT) == 0)) {
                return static_cast<uint32_t>(i);
            }
        }
    }

    for (size_t i = 0; i < queueProps.size(); i++) {
        if (queueProps[i].queueFlags & queueFlags) {
            return static_cast<uint32_t>(i);
        }
    }

    std::cout << "Could not find a matching queue family index" << std::endl;
    return static_cast<uint32_t>(-1);
}

static VkBool32 UserCallback(VkDebugUtilsMessageSeverityFlagBitsEXT messageSeverity,
                             VkDebugUtilsMessageTypeFlagsEXT messageType,
                             const VkDebugUtilsMessengerCallbackDataEXT* pCallbackData,
                             void* pUserData)
{
    (void)messageType;
    (void)pUserData;
    std::string prefix("");
    if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT) {
        prefix = "ERROR: ";
    } else if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT) {
        prefix = "WARN: ";
    } else if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT) {
        prefix = "INFO: ";
    } else if (messageSeverity & VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT) {
        prefix = "DEBUG: ";
    }
    debugMessage << prefix << "[" << pCallbackData->messageIdNumber << "][" << pCallbackData->pMessageIdName
                 << "] : " << pCallbackData->pMessage;
    return VK_FALSE;
}

static void TearDownTestCase()
{
    if (device != nullptr) {
        if (swapChain != VK_NULL_HANDLE) {
            fpDestroySwapchainKHR(device, swapChain, nullptr);
        }
        vkDestroyDevice(device, nullptr);
        device = nullptr;
    }
    if (instance != nullptr) {
        if (surface != VK_NULL_HANDLE) {
            vkDestroySurfaceKHR(instance, surface, nullptr);
            surface = VK_NULL_HANDLE;
        }
        vkDestroyInstance(instance, nullptr);
        instance = nullptr;
    }
}

int LoadBaseFuncPtrTest()
{
    uint32_t extensionCount = 0;
    VkResult result = vkEnumerateInstanceExtensionProperties(nullptr, &extensionCount, nullptr);
    if (result != VK_SUCCESS) {
        g_isSupportedVulkan = false;
        return 0;
    }
    std::cout << "Vulkan base functions available, extension count: " << extensionCount << std::endl;
    TrytoCreateVkInstance();
    std::cout << "LoadBaseFuncPtr test completed, device Vulkan support: "
              << (g_isSupportedVulkan ? "true" : "false (no drivers)") << std::endl;
    return 0;
}

template <typename T> static bool LoadInstanceFunc(T& funcPtr, const char* funcName)
{
    funcPtr = reinterpret_cast<T>(vkGetInstanceProcAddr(instance, funcName));
    return funcPtr != nullptr;
}

static bool LoadInstanceCoreFunc()
{
    if (!LoadInstanceFunc(vkDestroyInstance, "vkDestroyInstance")) {
        return false;
    }
    if (!LoadInstanceFunc(vkEnumeratePhysicalDevices, "vkEnumeratePhysicalDevices")) {
        return false;
    }
    if (!LoadInstanceFunc(vkCreateDevice, "vkCreateDevice")) {
        return false;
    }
    if (!LoadInstanceFunc(vkDestroyDevice, "vkDestroyDevice")) {
        return false;
    }
    if (!LoadInstanceFunc(vkDestroySurfaceKHR, "vkDestroySurfaceKHR")) {
        return false;
    }
    if (!LoadInstanceFunc(vkCreateSurfaceOHOS, "vkCreateSurfaceOHOS")) {
        return false;
    }
    return true;
}

static bool LoadInstanceSurfaceFunc()
{
    if (!LoadInstanceFunc(fpGetPhysicalDeviceSurfaceCapabilitiesKHR, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR")) {
        return false;
    }
    if (!LoadInstanceFunc(fpGetPhysicalDeviceSurfacePresentModesKHR, "vkGetPhysicalDeviceSurfacePresentModesKHR")) {
        return false;
    }
    if (!LoadInstanceFunc(fpGetPhysicalDeviceSurfaceFormatsKHR, "vkGetPhysicalDeviceSurfaceFormatsKHR")) {
        return false;
    }
    if (!LoadInstanceFunc(vkGetPhysicalDeviceSurfaceSupportKHR, "vkGetPhysicalDeviceSurfaceSupportKHR")) {
        return false;
    }
    return true;
}

static bool LoadInstanceDeviceFunc()
{
    if (!LoadInstanceFunc(vkGetPhysicalDeviceQueueFamilyProperties, "vkGetPhysicalDeviceQueueFamilyProperties")) {
        return false;
    }
    if (!LoadInstanceFunc(vkGetPhysicalDeviceProperties, "vkGetPhysicalDeviceProperties")) {
        return false;
    }
    if (!LoadInstanceFunc(vkGetPhysicalDeviceFeatures, "vkGetPhysicalDeviceFeatures")) {
        return false;
    }
    if (!LoadInstanceFunc(vkGetPhysicalDeviceMemoryProperties, "vkGetPhysicalDeviceMemoryProperties")) {
        return false;
    }
    return true;
}

static bool LoadInstanceDebugFunc()
{
    if (!LoadInstanceFunc(vkCreateDebugUtilsMessengerEXT, "vkCreateDebugUtilsMessengerEXT")) {
        return false;
    }
    if (!LoadInstanceFunc(vkDestroyDebugUtilsMessengerEXT, "vkDestroyDebugUtilsMessengerEXT")) {
        return false;
    }
    return true;
}

int LoadInstanceFuncPtrTest()
{
    std::cout << "g_isSupportedVulkan: " << g_isSupportedVulkan << std::endl;
    if (!g_isSupportedVulkan) {
        return 0;
    }
    if (instance == nullptr || vkGetInstanceProcAddr == nullptr) {
        return -1;
    }

    if (!LoadInstanceCoreFunc()) {
        return -1;
    }
    if (!LoadInstanceSurfaceFunc()) {
        return -1;
    }
    if (!LoadInstanceDeviceFunc()) {
        return -1;
    }
    if (!LoadInstanceDebugFunc()) {
        return -1;
    }
    return 0;
}

int VkEnumeratePhysicalDevicesTest()
{
    std::cout << "g_isSupportedVulkan: " << g_isSupportedVulkan << std::endl;
    if (!g_isSupportedVulkan) {
        return 0;
    }
    if (instance == nullptr || vkEnumeratePhysicalDevices == nullptr) {
        return -1;
    }

    uint32_t gpuCount = 0;
    VkResult err = vkEnumeratePhysicalDevices(instance, &gpuCount, nullptr);
    if (err != VK_SUCCESS || gpuCount == 0) {
        return -1;
    }
    std::vector<VkPhysicalDevice> physicalDevices(gpuCount);
    err = vkEnumeratePhysicalDevices(instance, &gpuCount, physicalDevices.data());
    if (err != VK_SUCCESS || physicalDevices.empty()) {
        return -1;
    }
    physicalDevice = physicalDevices[0];
    if (physicalDevice == nullptr) {
        return -1;
    }

    VkPhysicalDeviceProperties deviceProperties;
    VkPhysicalDeviceFeatures deviceFeatures;
    VkPhysicalDeviceMemoryProperties deviceMemoryProperties;
    vkGetPhysicalDeviceProperties(physicalDevice, &deviceProperties);
    vkGetPhysicalDeviceFeatures(physicalDevice, &deviceFeatures);
    vkGetPhysicalDeviceMemoryProperties(physicalDevice, &deviceMemoryProperties);
    (void)deviceProperties;
    (void)deviceFeatures;
    (void)deviceMemoryProperties;
    return 0;
}

int VkCreateDeviceTest()
{
    std::cout << "g_isSupportedVulkan: " << g_isSupportedVulkan << std::endl;
    if (!g_isSupportedVulkan) {
        return 0;
    }
    if (vkCreateDevice == nullptr || physicalDevice == nullptr) {
        return -1;
    }

    VkDeviceCreateInfo deviceCreateInfo = {};
    deviceCreateInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;

    std::vector<VkDeviceQueueCreateInfo> queueCreateInfos;
    const float defaultQueuePriority = 0.0f;
    VkDeviceQueueCreateInfo queueInfo = {};
    queueInfo.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    queueInfo.queueFamilyIndex = GetQueueFamilyIndex(VK_QUEUE_GRAPHICS_BIT);
    if (queueInfo.queueFamilyIndex == static_cast<uint32_t>(-1)) {
        return -1;
    }
    queueInfo.queueCount = 1;
    queueInfo.pQueuePriorities = &defaultQueuePriority;
    queueCreateInfos.push_back(queueInfo);
    deviceCreateInfo.queueCreateInfoCount = static_cast<uint32_t>(queueCreateInfos.size());
    deviceCreateInfo.pQueueCreateInfos = queueCreateInfos.data();

    std::vector<const char*> deviceExtensions;
    deviceExtensions.push_back(VK_KHR_SWAPCHAIN_EXTENSION_NAME);
    deviceCreateInfo.enabledExtensionCount = static_cast<uint32_t>(deviceExtensions.size());
    deviceCreateInfo.ppEnabledExtensionNames = deviceExtensions.data();

    VkDevice logicalDevice = VK_NULL_HANDLE;
    VkResult err = vkCreateDevice(physicalDevice, &deviceCreateInfo, nullptr, &logicalDevice);
    std::cout << "vkCreateDevice err: " << err << std::endl;
    if (err != VK_SUCCESS || logicalDevice == VK_NULL_HANDLE) {
        return -1;
    }
    std::cout << "logicalDevice ptr: " << logicalDevice << std::endl;
    device = logicalDevice;
    return 0;
}

int GetNativeBufferPropertiesOhosTest()
{
    std::cout << "g_isSupportedVulkan: " << g_isSupportedVulkan << std::endl;
    if (!g_isSupportedVulkan) {
        return 0;
    }
    if (vkCreateDevice == nullptr || physicalDevice == nullptr || vkGetDeviceProcAddr == nullptr) {
        return -1;
    }

    VkDeviceCreateInfo deviceCreateInfo = {};
    deviceCreateInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;

    std::vector<VkDeviceQueueCreateInfo> queueCreateInfos;
    const float defaultQueuePriority = 0.0f;
    VkDeviceQueueCreateInfo queueInfo = {};
    queueInfo.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    queueInfo.queueFamilyIndex = GetQueueFamilyIndex(VK_QUEUE_GRAPHICS_BIT);
    if (queueInfo.queueFamilyIndex == static_cast<uint32_t>(-1)) {
        return -1;
    }
    queueInfo.queueCount = 1;
    queueInfo.pQueuePriorities = &defaultQueuePriority;
    queueCreateInfos.push_back(queueInfo);
    deviceCreateInfo.queueCreateInfoCount = static_cast<uint32_t>(queueCreateInfos.size());
    deviceCreateInfo.pQueueCreateInfos = queueCreateInfos.data();

    std::vector<const char*> deviceExtensions;
    deviceExtensions.push_back(VK_KHR_SWAPCHAIN_EXTENSION_NAME);
    deviceCreateInfo.enabledExtensionCount = static_cast<uint32_t>(deviceExtensions.size());
    deviceCreateInfo.ppEnabledExtensionNames = deviceExtensions.data();

    VkDevice logicalDevice = VK_NULL_HANDLE;
    VkResult err = vkCreateDevice(physicalDevice, &deviceCreateInfo, nullptr, &logicalDevice);
    if (err != VK_SUCCESS || logicalDevice == VK_NULL_HANDLE) {
        return -1;
    }
    device = logicalDevice;

    OH_NativeBuffer* aHardBuffer = {};
    VkNativeBufferPropertiesOHOS nativeBufferPropertiesOHOS = {};
    VkNativeBufferFormatPropertiesOHOS nativeBufferFormatPropertiesOHOS = {};
    nativeBufferFormatPropertiesOHOS.sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_FORMAT_PROPERTIES_OHOS;
    nativeBufferFormatPropertiesOHOS.pNext = nullptr;
    nativeBufferPropertiesOHOS.sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_PROPERTIES_OHOS;
    nativeBufferPropertiesOHOS.pNext = &nativeBufferFormatPropertiesOHOS;

    fpGetNativeBufferPropertiesOHOS = reinterpret_cast<PFN_vkGetNativeBufferPropertiesOHOS>(
        vkGetDeviceProcAddr(device, "vkGetNativeBufferPropertiesOHOS"));
    if (fpGetNativeBufferPropertiesOHOS == nullptr) {
        return 0;
    }
    return 0;
}

int GetMemoryNativeBufferOhosTest()
{
    std::cout << "g_isSupportedVulkan: " << g_isSupportedVulkan << std::endl;
    if (!g_isSupportedVulkan) {
        return 0;
    }
    if (vkCreateDevice == nullptr || physicalDevice == nullptr || vkGetDeviceProcAddr == nullptr) {
        return -1;
    }
    VkDeviceCreateInfo deviceCreateInfo = {};
    deviceCreateInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
    std::vector<VkDeviceQueueCreateInfo> queueCreateInfos;
    const float defaultQueuePriority = 0.0f;
    VkDeviceQueueCreateInfo queueInfo = {};
    queueInfo.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    queueInfo.queueFamilyIndex = GetQueueFamilyIndex(VK_QUEUE_GRAPHICS_BIT);
    if (queueInfo.queueFamilyIndex == static_cast<uint32_t>(-1)) {
        return -1;
    }
    queueInfo.queueCount = 1;
    queueInfo.pQueuePriorities = &defaultQueuePriority;
    queueCreateInfos.push_back(queueInfo);
    deviceCreateInfo.queueCreateInfoCount = static_cast<uint32_t>(queueCreateInfos.size());
    deviceCreateInfo.pQueueCreateInfos = queueCreateInfos.data();
    std::vector<const char*> deviceExtensions;
    deviceExtensions.push_back(VK_KHR_SWAPCHAIN_EXTENSION_NAME);
    deviceCreateInfo.enabledExtensionCount = static_cast<uint32_t>(deviceExtensions.size());
    deviceCreateInfo.ppEnabledExtensionNames = deviceExtensions.data();
    VkDevice logicalDevice = VK_NULL_HANDLE;
    VkResult err = vkCreateDevice(physicalDevice, &deviceCreateInfo, nullptr, &logicalDevice);
    if (err != VK_SUCCESS || logicalDevice == VK_NULL_HANDLE) {
        return -1;
    }
    device = logicalDevice;
    OH_NativeBuffer* aHardBuffer = {};
    VkDeviceMemory hardwareBufferMemory = {};
    VkMemoryGetNativeBufferInfoOHOS getNativeBufferInfoOHOS = {};
    getNativeBufferInfoOHOS.sType = VK_STRUCTURE_TYPE_MEMORY_GET_NATIVE_BUFFER_INFO_OHOS;
    getNativeBufferInfoOHOS.pNext = nullptr;
    getNativeBufferInfoOHOS.memory = hardwareBufferMemory;
    fpGetMemoryNativeBufferOHOS =
        reinterpret_cast<PFN_vkGetMemoryNativeBufferOHOS>(vkGetDeviceProcAddr(device, "vkGetMemoryNativeBufferOHOS"));
    if (fpGetMemoryNativeBufferOHOS == nullptr) {
        return 0;
    }
    return 0;
}

} // namespace loader
} // namespace vulkan
