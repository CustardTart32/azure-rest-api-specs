import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "@typespec/rest";
import "./models.tsp";

using TypeSpec.Rest;
using Azure.ResourceManager;
using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Microsoft.Compute;
/**
 * Specifies information about the SSH public key.
 */
model SshPublicKeyResource
  is Azure.ResourceManager.TrackedResource<SshPublicKeyResourceProperties> {
  ...ResourceNameParameter<
    Resource = SshPublicKeyResource,
    KeyName = "sshPublicKeyName",
    SegmentName = "sshPublicKeys",
    NamePattern = ""
  >;
}

@armResourceOperations
interface SshPublicKeyResources {
  /**
   * Retrieves information about an SSH public key.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SshPublicKeys_Get")
  get is ComputeResourceRead<SshPublicKeyResource>;

  /**
   * Creates a new SSH public key resource.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SshPublicKeys_Create")
  create is ComputeResourceCreateOrReplaceSync<SshPublicKeyResource>;

  /**
   * Updates a new SSH public key resource.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @patch(#{ implicitOptionality: false })
  @operationId("SshPublicKeys_Update")
  update is ComputeCustomPatchSync<
    SshPublicKeyResource,
    SshPublicKeyUpdateResource
  >;

  /**
   * Delete an SSH public key.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  #suppress "@azure-tools/typespec-azure-core/no-response-body" "For backward compatibility"
  @operationId("SshPublicKeys_Delete")
  delete is ComputeResourceDeleteSync<SshPublicKeyResource>;

  /**
   * Lists all of the SSH public keys in the specified resource group. Use the nextLink property in the response to get the next page of SSH public keys.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SshPublicKeys_ListByResourceGroup")
  listByResourceGroup is ComputeResourceListByParent<
    SshPublicKeyResource,
    Response = SshPublicKeysGroupListResult
  >;

  /**
   * Lists all of the SSH public keys in the subscription. Use the nextLink property in the response to get the next page of SSH public keys.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SshPublicKeys_ListBySubscription")
  listBySubscription is ComputeListBySubscription<
    SshPublicKeyResource,
    Response = SshPublicKeysGroupListResult
  >;

  /**
   * Generates and returns a public/private key pair and populates the SSH public key resource with the public key. The length of the key will be 3072 bits. This operation can only be performed once per SSH public key resource.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SshPublicKeys_GenerateKeyPair")
  generateKeyPair is ComputeResourceActionSync<
    SshPublicKeyResource,
    {
      /**
       * Parameters supplied to generate the SSH public key.
       */
      @bodyRoot parameters?: SshGenerateKeyPairInputParameters;
    },
    SshPublicKeyGenerateKeyPairResult
  >;
}

@@doc(SshPublicKeyResource.name, "The name of the SSH public key.");
@@doc(SshPublicKeyResource.properties, "Properties of the SSH public key.");
@@doc(SshPublicKeyResources.create::parameters.resource,
  "Parameters supplied to create the SSH public key."
);
@@doc(SshPublicKeyResources.update::parameters.properties,
  "Parameters supplied to update the SSH public key."
);
@@doc(SshPublicKeyResources.generateKeyPair::parameters.body,
  "Parameters supplied to generate the SSH public key."
);
