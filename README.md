# 🛒 SIGMA — Sistema Integral de Gestión de Minimarket

> Sistema POS (Point of Sale) full-stack para minimarkets con gestión de inventario, caja, reportes y pagos QR (Yape / Plin).

<p align="center">
  <img src="https://img.shields.io/badge/status-finished-success?style=flat-square" alt="Status" />
  <img src="https://img.shields.io/badge/license-ISC-blue?style=flat-square" alt="License" />
  <img src="https://img.shields.io/badge/platform-Web%20%2B%20Android-informational?style=flat-square" alt="Platform" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white" />
  <img src="https://img.shields.io/badge/Express-000000?style=for-the-badge&logo=express&logoColor=white" />
  <img src="https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white" />
  <img src="https://img.shields.io/badge/JWT-000000?style=for-the-badge&logo=json-web-tokens&logoColor=white" />
  <img src="https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB" />
  <img src="https://img.shields.io/badge/Vite-646CFF?style=for-the-badge&logo=vite&logoColor=white" />
  <img src="https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white" />
  <img src="https://img.shields.io/badge/Zustand-000000?style=for-the-badge&logo=react&logoColor=white" />
  <img src="https://img.shields.io/badge/Capacitor-119EFF?style=for-the-badge&logo=capacitor&logoColor=white" />
  <img src="https://img.shields.io/badge/Jest-C21325?style=for-the-badge&logo=jest&logoColor=white" />
  <img src="https://img.shields.io/badge/Playwright-2EAD33?style=for-the-badge&logo=playwright&logoColor=white" />
</p>

---

## 📋 Tabla de contenidos

- [Sobre el proyecto](#-sobre-el-proyecto)
- [Capturas de pantalla](#-capturas-de-pantalla)
- [Funcionalidades](#-funcionalidades)
- [Stack tecnológico](#️-stack-tecnológico)
- [Arquitectura](#️-arquitectura)
- [Modelo de datos](#-modelo-de-datos)
- [Instalación](#-instalación)
- [Uso](#-uso)
- [Endpoints principales](#-endpoints-principales)
- [Testing](#-testing)
- [Estructura del proyecto](#-estructura-del-proyecto)
- [Autores](#-autores)
- [Licencia](#-licencia)

---

## 🎯 Sobre el proyecto

**SIGMA** es un sistema POS (Point of Sale) completo diseñado para la operación diaria de un minimarket peruano. Resuelve tareas que una hoja de Excel ya no puede cubrir: registrar ventas con múltiples métodos de pago, controlar el stock en tiempo real mediante Kardex, gestionar la apertura y cierre de caja con detección automática de diferencias, y generar reportes gerenciales con visualización gráfica.

El sistema incluye una **aplicación web** (Vite + React) y una **app Android** empaquetada con Capacitor, ambas conectadas a una misma API REST en Node.js + Express con MySQL.

**Proyecto académico desarrollado en el Instituto IDAT** como trabajo final del curso de desarrollo de sistemas.

---

## 📸 Capturas de pantalla

> *Agrega aquí capturas de las pantallas principales del sistema.*

| Pantalla | Vista previa |
|----------|--------------|
| 🔐 Login | `./docs/screenshots/login.png` |
| 📊 Dashboard | `./docs/screenshots/dashboard.png` |
| 💵 Punto de venta (POS) | `./docs/screenshots/pos.png` |
| 📦 Gestión de productos | `./docs/screenshots/products.png` |
| 📈 Reportes | `./docs/screenshots/reports.png` |

---

## ✨ Funcionalidades

### 🔐 Autenticación y roles (RBAC)

Sistema de control de accesos basado en 3 roles:

- **Administrador** — control total del sistema (usuarios, configuración, anulación de ventas).
- **Gerente** — reportes gerenciales, gestión de productos y precios, supervisión.
- **Cajero** — operaciones de venta, apertura y cierre de caja.

Autenticación mediante **JWT** con contraseñas hasheadas con **bcrypt** y refresh tokens.

### 💵 Módulo POS (Punto de venta)

- Venta rápida con búsqueda por código de barras o nombre.
- Carrito de compras dinámico.
- **Múltiples métodos de pago en una misma transacción**: Efectivo, Yape, Plin, Tarjeta.
- Generación de código QR para cobros Yape/Plin.
- Cálculo automático de vuelto.
- Validación de stock en tiempo real.

### 📦 Gestión de productos

- CRUD completo con imágenes (subida con Multer, máximo 5 MB).
- Categorización de productos.
- **Sistema de unidades de medida (UOM)** con factores de conversión: unidad, docena, pack, six pack, caja, kg, g, lb, oz, L, ml, galón.
- Alertas automáticas de stock mínimo y máximo.
- Actualización masiva de precios.
- *Soft delete* para preservar el histórico.

### 📊 Inventario con Kardex

Historial completo de movimientos por producto, incluyendo:

- Tipo de movimiento: ENTRADA, SALIDA, VENTA, AJUSTE, DEVOLUCIÓN.
- Motivo del cambio: Compra, Venta, Merma, Vencimiento, Pérdida, Ajuste.
- Stock anterior y posterior a cada movimiento.
- Proveedor y responsable del movimiento.
- Trazabilidad completa para auditorías.

### 💰 Control de caja

- Apertura de caja con monto inicial.
- Registro de movimientos (ingresos y egresos no asociados a ventas).
- Cierre de caja con **cálculo automático de diferencia** entre lo esperado y lo declarado.
- Resumen por método de pago (efectivo, QR, tarjeta).
- Historial de cajas con filtros por fecha y cajero.

### 📈 Reportes

- Ventas por día, semana, mes o rango personalizado.
- Top de productos más vendidos.
- Análisis de ingresos por método de pago.
- Gráficos interactivos con **Recharts**.
- **Exportación a PDF** con jsPDF + autoTable.

### 🔍 Auditoría

Registro automático (`audit_log`) de acciones críticas: quién hizo qué, cuándo, desde qué IP, con valores anteriores y nuevos del registro afectado.

---

## 🛠️ Stack tecnológico

### Backend

| Tecnología | Uso |
|------------|-----|
| **Node.js 18+** | Runtime |
| **Express 4** | Framework HTTP |
| **MySQL 8** | Base de datos relacional |
| **mysql2** | Driver MySQL con pool de conexiones |
| **JSON Web Token** | Autenticación stateless |
| **bcrypt / bcryptjs** | Hash de contraseñas |
| **Helmet** | Cabeceras HTTP de seguridad |
| **CORS** | Control de orígenes permitidos |
| **express-validator** | Validación de entrada |
| **Multer** | Subida de archivos |
| **UUID** | Identificadores únicos |
| **dotenv** | Variables de entorno |

### Frontend

| Tecnología | Uso |
|------------|-----|
| **React 18** | Librería UI |
| **Vite 5** | Bundler y dev server |
| **React Router 6** | Enrutamiento |
| **Zustand** | Gestión de estado global |
| **Tailwind CSS 3** | Estilos utility-first |
| **Recharts** | Gráficos y visualizaciones |
| **jsPDF + autoTable** | Exportación a PDF |
| **qrcode.react** | Generación de QR |
| **Lucide React** | Iconos |
| **Axios** | Cliente HTTP |
| **date-fns** | Manipulación de fechas |
| **Capacitor 8** | Empaquetado como app Android |

### Testing

| Tecnología | Uso |
|------------|-----|
| **Jest + Supertest** | Tests unitarios y de integración del backend |
| **Vitest + Testing Library** | Tests del frontend |
| **Playwright** | Tests End-to-End |

---

## 🏗️ Arquitectura

Backend organizado en capas siguiendo separación de responsabilidades:

```
┌──────────────────────────────────────────────┐
│                 HTTP Client                   │
│    (React Web  |  Android App - Capacitor)    │
└─────────────────────┬────────────────────────┘
                      │ HTTPS / JSON
┌─────────────────────▼────────────────────────┐
│              Routes (Express)                 │
│  auth · products · sales · cash · inventory   │
└─────────────────────┬────────────────────────┘
                      │
┌─────────────────────▼────────────────────────┐
│   Middleware: auth · logger · validation      │
└─────────────────────┬────────────────────────┘
                      │
┌─────────────────────▼────────────────────────┐
│                Controllers                    │
│     (manejo de request/response HTTP)         │
└─────────────────────┬────────────────────────┘
                      │
┌─────────────────────▼────────────────────────┐
│                  Services                     │
│        (lógica de negocio principal)          │
└─────────────────────┬────────────────────────┘
                      │
┌─────────────────────▼────────────────────────┐
│                Repositories                   │
│         (acceso a datos / SQL puro)           │
└─────────────────────┬────────────────────────┘
                      │
┌─────────────────────▼────────────────────────┐
│                MySQL 8.0+                     │
│    (12 tablas, 15 índices, 3 vistas)          │
└──────────────────────────────────────────────┘
```

---

## 🗄️ Modelo de datos

**12 tablas principales:**

| Tabla | Descripción |
|-------|-------------|
| `roles` | Roles del sistema (RBAC) |
| `users` | Usuarios autenticados |
| `categories` | Categorías de productos |
| `units` | Unidades de medida con conversiones |
| `products` | Catálogo de productos con stock |
| `kardex` | Historial de movimientos de inventario |
| `cash_drawer` | Cajas abiertas/cerradas |
| `cash_movements` | Ingresos/egresos de caja |
| `sales` | Cabeceras de venta |
| `sale_details` | Ítems de cada venta |
| `payment_methods` | Métodos de pago por venta |
| `audit_log` | Auditoría general del sistema |
| `suppliers` | Proveedores |

**Vistas útiles incluidas:** `vw_stock_critico`, `vw_resumen_caja`, `vw_productos_mas_vendidos`.

El script completo está en [`database-mysql.sql`](./database-mysql.sql).

---

## 🚀 Instalación

### Prerrequisitos

- [Node.js 18+](https://nodejs.org/)
- [MySQL 8+](https://dev.mysql.com/downloads/) o **XAMPP** con MySQL en el puerto 3306
- npm 9+

### 1. Clonar el repositorio

```bash
git clone https://github.com/Chil69/sigma-minimarket.git
cd sigma-minimarket
```

### 2. Configurar el backend

```bash
# Instalar dependencias
npm install

# Copiar y editar variables de entorno
cp .env.example .env
# Edita .env con tus credenciales de MySQL y un JWT_SECRET seguro

# Crear la base de datos
mysql -u root -p < database-mysql.sql

# Inicializar datos de prueba (opcional)
npm run init-db

# Iniciar servidor en modo desarrollo
npm run dev
```

El backend quedará corriendo en `http://localhost:3000`.

### 3. Configurar el frontend

En otra terminal:

```bash
cd frontend
npm install
npm run dev
```

El frontend quedará corriendo en `http://localhost:5173`.

### 4. (Opcional) Generar APK para Android

```bash
cd frontend
npm run build:android
npm run android:sync
npm run android:open   # abre Android Studio
```

### ⚡ Inicio rápido (Windows)

Si estás en Windows, ejecuta `levantar_proyecto.bat` desde la raíz del proyecto — levanta backend y frontend automáticamente.

---

## 📖 Uso

### Credenciales por defecto

Después de correr el seed inicial:

| Rol | Usuario | Contraseña |
|-----|---------|------------|
| Administrador | `admin` | `admin123` |
| Gerente | `gerente` | `gerente123` |
| Cajero | `cajero` | `cajero123` |

> ⚠️ **Cámbialas inmediatamente antes de cualquier despliegue en producción.**

### Flujo típico de una jornada

1. **Cajero inicia sesión** → abre caja con monto inicial.
2. **Registra ventas** desde el POS → selecciona productos, elige método(s) de pago, confirma.
3. **Gerente supervisa** el dashboard en tiempo real.
4. **Cierre de caja** al final del turno → el sistema muestra la diferencia entre lo esperado y lo declarado.
5. **Administrador genera reportes** del día y los exporta a PDF.

---

## 🔌 Endpoints principales

Base URL: `http://localhost:3000/api`

### Autenticación

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| `POST` | `/auth/login` | Iniciar sesión y obtener JWT |
| `POST` | `/auth/register` | Registrar usuario (Admin) |
| `GET` | `/auth/me` | Datos del usuario actual |

### Productos

| Método | Endpoint | Descripción | Roles |
|--------|----------|-------------|-------|
| `GET` | `/products` | Listar productos (paginado) | Todos |
| `GET` | `/products/low-stock` | Productos con stock bajo | Todos |
| `GET` | `/products/:id` | Obtener producto | Todos |
| `POST` | `/products` | Crear producto | Admin, Gerente |
| `PUT` | `/products/:id` | Actualizar producto | Admin, Gerente |
| `PATCH` | `/products/:id/prices` | Actualizar solo precios | Admin, Gerente |
| `PATCH` | `/products/:id/stock` | Actualizar stock | Admin, Gerente |
| `POST` | `/products/:id/image` | Subir imagen | Admin, Gerente |
| `DELETE` | `/products/:id` | Eliminar (soft) | Admin |

### Ventas

| Método | Endpoint | Descripción | Roles |
|--------|----------|-------------|-------|
| `GET` | `/sales` | Listar ventas | Todos |
| `POST` | `/sales` | Crear venta | Cajero, Admin, Gerente |
| `GET` | `/sales/:id` | Obtener venta con detalles | Todos |
| `DELETE` | `/sales/:id` | Anular venta | Admin |

### Caja

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| `POST` | `/cash-drawer/open` | Abrir caja |
| `GET` | `/cash-drawer/current` | Caja actualmente abierta |
| `POST` | `/cash-drawer/close` | Cerrar caja |
| `POST` | `/cash-drawer/movements` | Registrar movimiento |
| `GET` | `/cash-drawer/history` | Historial de cajas |

### Otros módulos

- `/inventory` — movimientos y ajustes de inventario (Kardex)
- `/reports` — reportes de ventas, productos y caja
- `/units` — unidades de medida
- `/settings` — configuración general

---

## 🧪 Testing

### Backend

```bash
npm test               # todos los tests
npm run test:smoke     # smoke tests
npm run test:journey   # tests de flujos completos
npm run test:coverage  # con reporte de cobertura
```

### Frontend

```bash
cd frontend
npm test               # tests unitarios con Vitest
npm run test:e2e       # tests End-to-End con Playwright
npm run test:e2e:ui    # modo interactivo
```

Tests E2E incluidos para los flujos de **autenticación**, **POS**, **inventario** y **reportes**.

---

## 📁 Estructura del proyecto

```
sigma-minimarket/
├── src/                          # Backend
│   ├── config/                   # Configuración (DB pool)
│   ├── controllers/              # Controladores HTTP
│   ├── services/                 # Lógica de negocio
│   ├── repositories/             # Acceso a datos
│   ├── routes/                   # Definición de rutas
│   ├── middleware/               # auth, logger, errorHandler
│   ├── validators/               # Validadores express-validator
│   ├── utils/                    # Utilidades
│   └── index.js                  # Punto de entrada
│
├── frontend/                     # Frontend
│   ├── src/
│   │   ├── components/           # Componentes reutilizables
│   │   ├── pages/                # Páginas (Dashboard, POS, etc.)
│   │   ├── stores/               # Stores de Zustand
│   │   ├── services/             # Cliente API (Axios)
│   │   ├── hooks/                # Custom hooks
│   │   └── styles/               # CSS global y accesibilidad
│   ├── tests/                    # Tests unitarios (Vitest)
│   ├── tests-e2e/                # Tests E2E (Playwright)
│   └── capacitor.config.json     # Configuración Android
│
├── tests/                        # Tests del backend
├── scripts/                      # Scripts de inicialización
├── uploads/                      # Archivos subidos (imágenes, QR)
├── database-mysql.sql            # Script de creación de BD
├── levantar_proyecto.bat         # Lanzador rápido (Windows)
└── package.json
```

---

## 👥 Autores

Proyecto académico desarrollado en el **Instituto IDAT** — carrera de Desarrollo de Sistemas.

- **Fabrizio Jiménez Chil** — [@Chil69](https://github.com/Chil69)

---

## 📄 Licencia

Distribuido bajo la licencia ISC. Ver `LICENSE` para más información.

Proyecto con fines académicos. 2026.

---

<p align="center">
  <em>Si este proyecto te parece útil, considera darle una ⭐ en GitHub.</em>
</p>
