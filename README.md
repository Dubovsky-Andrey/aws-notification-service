# Notification Platform Terraform Project

## Overview

This Terraform project deploys a Notification Platform on AWS with the following components:

- **Lambda Function**: Processes notification events (implemented in Python).
- **SNS Topics**: Separate topics for Email, SMS, and Push notifications.
- **API Gateway**: Provides a REST API endpoint to trigger the Lambda function.
- **S3 Website**: Hosts a static website with a button to send a test notification.
- **IAM Roles**: Provides necessary permissions for Lambda execution.

## Architecture

Система построена из модульных компонентов, что обеспечивает независимое управление состоянием (state files) и уменьшает риск конфликтов при развертывании. Каждый модуль имеет собственный README.md с описанием его функционала.

- **IAM Module**: Создает IAM роль для выполнения Lambda функций.
- **Lambda Module**: Разворачивает Lambda функцию на Python, которая обрабатывает входящие уведомления.
- **SNS Module**: Создает SNS темы для разных каналов уведомлений.
- **API Gateway Module**: Обеспечивает REST API для вызова Lambda функции.
- **S3 Website Module**: Разворачивает статический сайт на S3, позволяющий отправлять тестовые уведомления через кнопку.

## State Management

Микро-сегментация state-файлов реализована посредством использования отдельного S3 бакета и DynamoDB для блокировки, что снижает вероятность конфликтов и ограничивает "blast radius" в случае ошибок.

## Развертывание

Перед запуском убедитесь, что заданы необходимые переменные в файле `terraform.tfvars` или через переменные окружения. Для развертывания выполните следующие команды:

```bash
terraform init
terraform plan
terraform apply
```
