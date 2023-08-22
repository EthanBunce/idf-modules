# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

CURRENT_LLC_CONTENT=$(aws sagemaker describe-studio-lifecycle-config --studio-lifecycle-config-name $SEEDFARMER_PARAMETER_SERVER_LIFECYCLE_NAME | jq -r ."StudioLifecycleConfigContent")

if [ "$CURRENT_LLC_CONTENT" != "$LCC_CONTENT" ]; then
    echo "Lifecycle configuration content needs to be updated, but lifecycle config $SEEDFARMER_PARAMETER_SERVER_LIFECYCLE_NAME already exists. Please manually remove the SageMaker studio LCC with name $SEEDFARMER_PARAMETER_SERVER_LIFECYCLE_NAME or name the configuration differently"
    exit 1
fi